class ZCL_PM_MASS_RECEIPT_HELPER definition
  public
  create public .

public section.

  class-methods CHECK_GOOD_RECEIPT_DATA
    importing
      !MOVEMENT type ZSPM_MASS_RCPT_MOVEMENT
      !SERIAL_NUMBERS type ZTPM_MASS_RCPT_SER_NUM
    raising
      ZCX_PM_MASS_RCPT_VALIDATION .
  class-methods GENERATE_LOG_ID
    returning
      value(ID) type ZEPM_MASS_RCP_LOG_ID .
  class-methods PERFORM_GOOD_RECEIPT
    changing
      !MOVEMENT type ZSPM_MASS_RCPT_MOVEMENT
      !SERIAL_NUMBERS type ZTPM_MASS_RCPT_SER_NUM
    returning
      value(RETURN) type BAPIRET2_T
    raising
      ZCX_PM_GOOD_RECEIPT_ERROR .
  class-methods CREATE_LOG
    importing
      !PURCHASE_ORDER type EBELN
      !PURCHASE_ORDER_ITEM type EBELP
      !DISPLAY_CURRENCY type VDM_V_DISPLAY_CURRENCY
      !QUANTITY type MENGE_D
      !UNIT_OF_MEASURE type MEINS
      !VALUATION_TYPE type BWTAR_D
      !BATCH_NUMBER type CHARG_D
      !POSTING_DATE type BUDAT
      !DOCUMENT_DATE type BLDAT
      !MATERIAL_DOCUMENT type MBLNR
      !MATERIAL_DOCUMENT_YEAR type MJAHR
    returning
      value(LOG_ID) type ZEPM_MASS_RCP_LOG_ID .
protected section.
private section.
ENDCLASS.



CLASS ZCL_PM_MASS_RECEIPT_HELPER IMPLEMENTATION.


METHOD check_good_receipt_data.
*______________________________________________________________________________________*
* Description:
* See object description
* Techname: ZCL_PM_MASS_RECEIPT_HELPER====CM002
*______________________________________________________________________________________*
* Date of creation: 20.03.2024 16:33:10  / Author: MCHERIFI / Mourad CHERIFI (STMS)
* Reference document:
*  Description :  Check good receipt input data
*______________________________________________________________________________________*
* Historic of modifications
* Date / User name / Transport request / VYY-NN <Free>
* Description:
*______________________________________________________________________________________*

  DATA: lt_validation_messages TYPE zcx_pm_mass_rcpt_validation=>tyt_validation_messages.

  "Récupérer les données d'entête du poste (CDS ZC_PM_PurchaseOrderItemMoni)
  SELECT SINGLE * FROM ZC_PM_PurchaseOrderItemMoni( P_DisplayCurrency = @movement-display_currency )
    WHERE PurchaseOrder = @movement-purchasing_document_number AND
          PurchaseOrderItem = @movement-item_number
    INTO @DATA(ls_PurchaseOrderItem).
  IF sy-subrc <> 0.
    RAISE EXCEPTION TYPE zcx_pm_mass_rcpt_validation
      EXPORTING
        validation_messages = VALUE #( ( bapiret_msg-type = 'E'
                                         bapiret_msg-id = 'ZPM_MASS_RECEIPT'
                                         bapiret_msg-number = 004 "No data found for PO/Item (&1/&2)
                                         bapiret_msg-field = 'PURCHASING_DOCUMENT_NUMBER'
                                         bapiret_msg-message_v1 = movement-purchasing_document_number
                                         bapiret_msg-message_v2 = movement-item_number
                                         request_context = movement-_request_context ) ).
  ENDIF.

  "**************
  "* Quantité
  "**************
  IF movement-quantity <= 0.
    APPEND VALUE #( bapiret_msg-type = 'E'
                    bapiret_msg-id = 'ZPM_MASS_RECEIPT'
                    bapiret_msg-number = 010   "The quantity must be greater than zero / La quantité doit être supérieure à zéro
                    bapiret_msg-field = 'QUANTITY'
                    request_context = movement-_request_context ) TO lt_validation_messages[].
  ENDIF.

  IF movement-quantity > ls_PurchaseOrderItem-StillToBeDeliveredQuantity.
    APPEND VALUE #( bapiret_msg-type = 'E'
                    bapiret_msg-id = 'ZPM_MASS_RECEIPT'
                    bapiret_msg-number = 011   "The quantity entered (&1) exceeds the quantity to be received (&2) / La quantité entrée (&1) dépasse la quantité restant à livrer (2)
                    bapiret_msg-field = 'QUANTITY'
                    bapiret_msg-message_v1 = CONV #( movement-quantity )
                    bapiret_msg-message_v2 = CONV #( ls_PurchaseOrderItem-StillToBeDeliveredQuantity )
                    request_context = movement-_request_context ) TO lt_validation_messages[].
  ENDIF.

  "********************************
  "* Posting date & Document date
  "********************************
  IF movement-posting_date IS INITIAL.
    APPEND VALUE #( bapiret_msg-type = 'E'
                    bapiret_msg-id = 'ZPM_MASS_RECEIPT'
                    bapiret_msg-number = 012   "Posting date is mandatory / Date comptable est obligatoire
                    bapiret_msg-field = 'POSTING_DATE'
                    request_context = movement-_request_context ) TO lt_validation_messages[].
  ENDIF.

  IF movement-document_date IS INITIAL.
    APPEND VALUE #( bapiret_msg-type = 'E'
                    bapiret_msg-id = 'ZPM_MASS_RECEIPT'
                    bapiret_msg-number = 013   "Document date is mandatory / Date du document est obligatoire
                    bapiret_msg-field = 'DOCUMENT_DATE'
                    request_context = movement-_request_context ) TO lt_validation_messages[].
  ENDIF.


  "*******************************
  "* Batch number / N° de lot
  "*******************************
  IF ls_PurchaseOrderItem-BatchManagement = abap_true.
    IF movement-batch_number IS INITIAL.
      APPEND VALUE #( bapiret_msg-type = 'E'
                      bapiret_msg-id = 'ZPM_MASS_RECEIPT'
                      bapiret_msg-number = 005   "Batch number mandatory / N°lot est obligatoire
                      bapiret_msg-field = 'BATCH_NUMBER'
                      request_context = movement-_request_context ) TO lt_validation_messages[].
    ENDIF.
*    IF movement-batch_number IS NOT INITIAL.
*      SELECT SINGLE * FROM mch1 WHERE matnr = @ls_PurchaseOrderItem-Material AND charg = @ls_PurchaseOrderItem-batch
*        INTO @DATA(ls_mch1).
*      IF sy-subrc <> 0. "Batch N° not found for material
*        APPEND VALUE #( bapiret_msg-type = 'E'
*                      bapiret_msg-id = 'ZPM_MASS_RECEIPT'
*                      bapiret_msg-number = 006   "Batch number &1 not found for Material &2 (&3) / N°lot &1 non trouvé pour l'article &2 (&3)
*                      bapiret_msg-field = 'BATCH_NUMBER'
*                      bapiret_msg-message_v1 = movement-batch_number
*                      bapiret_msg-message_v2 = ls_PurchaseOrderItem-MaterialName
*                      bapiret_msg-message_v3 = ls_PurchaseOrderItem-Material
*                      request_context = movement-_request_context ) TO lt_validation_messages[].
*      ENDIF.
*    ENDIF.
  ENDIF.

  "***********************************************
  "* Valuation Type / Catégorie de Valorisation
  "***********************************************
  IF ls_PurchaseOrderItem-ValuationCategory = 'X'.
    IF movement-valuation_type IS INITIAL.
      APPEND VALUE #( bapiret_msg-type = 'E'
                      bapiret_msg-id = 'ZPM_MASS_RECEIPT'
                      bapiret_msg-number = 007   "Valuation type mandatory / Catégorie de valorisation est obligatoire
                      bapiret_msg-field = 'VALUATION_TYPE'
                      request_context = movement-_request_context ) TO lt_validation_messages[].
    ENDIF.

    IF movement-valuation_type IS NOT INITIAL.
      SELECT SINGLE * FROM t149d INTO @DATA(ls_t149d) WHERE bwtar = @movement-valuation_type.
      IF sy-subrc <> 0.
        APPEND VALUE #( bapiret_msg-type = 'E'
                      bapiret_msg-id = 'ZPM_MASS_RECEIPT'
                      bapiret_msg-number = 008   "Valuation type &1 doesn't exist / Le type de valorisation &1 n'existe pas
                      bapiret_msg-field = 'VALUATION_TYPE'
                      bapiret_msg-message_v1 = movement-valuation_type
                      request_context = movement-_request_context ) TO lt_validation_messages[].
      ENDIF.
    ENDIF.
  ENDIF.

  "*********************
  "* Serial Numbers
  "*********************
  IF ls_PurchaseOrderItem-SerialNumberProfile IS NOT INITIAL.
    DATA(lt_serial_numbers) = serial_numbers[].
    SORT lt_serial_numbers[] BY serial_number.
    DELETE ADJACENT DUPLICATES FROM lt_serial_numbers[] COMPARING serial_number..
    DELETE lt_serial_numbers[] WHERE serial_number IS INITIAL.

    IF lt_serial_numbers[] IS INITIAL.
      APPEND VALUE #( bapiret_msg-type = 'E'
                      bapiret_msg-id = 'ZPM_MASS_RECEIPT'
                      bapiret_msg-number = 009   "Serial numbers mandatory / Numéros de série obligatoires
                       bapiret_msg-field = 'PURCHASING_DOCUMENT_NUMBER'
                      request_context = movement-_request_context ) TO lt_validation_messages[].
    ENDIF.
  ENDIF.


  IF lt_validation_messages[] IS NOT INITIAL.
    RAISE EXCEPTION TYPE zcx_pm_mass_rcpt_validation EXPORTING validation_messages = lt_validation_messages[].
  ENDIF.

ENDMETHOD.


METHOD create_log.
*______________________________________________________________________________________*
* Description:
* See object description
* Techname: ZCL_PM_MASS_RECEIPT_HELPER====CM004
*______________________________________________________________________________________*
* Date of creation: 21.03.2024 16:07:16  / Author: MCHERIFI / Mourad CHERIFI (STMS)
* Reference document:
*  Description :  Create a new log
*______________________________________________________________________________________*
* Historic of modifications
* Date / User name / Transport request / VYY-NN <Free>
* Description:
*______________________________________________________________________________________*

  DATA: ls_log TYPE zta_mass_rcp_log.

  ls_log-log_id = generate_log_id( ).
  ls_log-purchase_order = purchase_order.
  ls_log-purchase_order_item = purchase_order_item.
  ls_log-display_currency = display_currency.
  ls_log-quantity = quantity.
  ls_log-unit_of_measure = unit_of_measure.
  ls_log-valuation_type = valuation_type.
  ls_log-batch_number = batch_number.
  ls_log-posting_date = posting_date.
  ls_log-document_date = document_date.
  ls_log-material_document = material_document.
  ls_log-material_document_year = material_document_year.
  ls_log-creation_date = sy-datum.
  ls_log-creation_user = sy-uname.

  INSERT zta_mass_rcp_log FROM ls_log.
  IF sy-subrc = 0.
    log_id = ls_log-log_id.
  ENDIF.

ENDMETHOD.


METHOD generate_log_id.
*______________________________________________________________________________________*
* Description:
* See object description
* Techname: ZCL_PM_MASS_RECEIPT_HELPER====CM003
*______________________________________________________________________________________*
* Date of creation: 20.03.2024 18:23:12  / Author: MCHERIFI / Mourad CHERIFI (STMS)
* Reference document:
*  Description : Generate a Log ID
*______________________________________________________________________________________*
* Historic of modifications
* Date / User name / Transport request / VYY-NN <Free>
* Description:
*______________________________________________________________________________________*


  DATA: lv_not_in_db TYPE boolean.
  DATA: lv_mandt TYPE mandt.

  WHILE lv_not_in_db = abap_false. "Do not take a number if already used in database

    CALL FUNCTION 'NUMBER_GET_NEXT'
      EXPORTING
        nr_range_nr             = '01'
        object                  = 'ZMASRCPLOG'
      IMPORTING
        number                  = id
      EXCEPTIONS
        interval_not_found      = 1
        number_range_not_intern = 2
        object_not_found        = 3
        quantity_is_0           = 4
        quantity_is_not_1       = 5
        interval_overflow       = 6
        buffer_overflow         = 7
        OTHERS                  = 8.

    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    CHECK id > 0.

    SELECT SINGLE mandt FROM zta_mass_rcp_log INTO lv_mandt WHERE log_id = id.
    IF sy-subrc <> 0.
      lv_not_in_db = abap_true.
    ENDIF.

  ENDWHILE.
ENDMETHOD.


METHOD perform_good_receipt.
*______________________________________________________________________________________*
* Description:
* See object description
* Techname: ZCL_PM_MASS_RECEIPT_HELPER====CM001
*______________________________________________________________________________________*
* Date of creation: 20.03.2024 13:13:21  / Author: MCHERIFI / Mourad CHERIFI (STMS)
* Reference document:
*  Description : Perform a good receipt
*______________________________________________________________________________________*
* Historic of modifications
* Date / User name / Transport request / VYY-NN <Free>
* Description:
*______________________________________________________________________________________*

  DATA: lt_po_items TYPE STANDARD TABLE OF bapiekpo.
  DATA: ls_goodsmvt_header TYPE bapi2017_gm_head_01.
  DATA: ls_goodsmvt_headret TYPE bapi2017_gm_head_ret.
  DATA: lt_goodsmvt_serialnumbers TYPE STANDARD TABLE OF bapi2017_gm_serialnumber.
  DATA: lt_item_account_assignment TYPE STANDARD TABLE OF bapiekkn.
  DATA: lt_goodsmvt_item TYPE STANDARD TABLE OF bapi2017_gm_item_create.

  "Récupérer les données de la commande d'achat (postes)
  CALL FUNCTION 'BAPI_PO_GETDETAIL'
    EXPORTING
      purchaseorder              = movement-purchasing_document_number
      items                      = abap_true
      account_assignment         = abap_true
    TABLES
      po_items                   = lt_po_items[]
      po_item_account_assignment = lt_item_account_assignment[].

  "Récupérer les données d'entête du poste (CDS ZC_PM_PurchaseOrderItemMoni)
  SELECT SINGLE * FROM ZC_PM_PurchaseOrderItemMoni( P_DisplayCurrency = @movement-display_currency )
    WHERE PurchaseOrder = @movement-purchasing_document_number AND
          PurchaseOrderItem = @movement-item_number
    INTO @DATA(ls_PurchaseOrderItem).
  IF sy-subrc <> 0.
    RAISE EXCEPTION TYPE zcx_pm_good_receipt_error
      EXPORTING
        bapiret_messages = VALUE #( ( type = 'E'
                                      id = 'ZPM_MASS_RECEIPT'
                                      number = 004  "No data found for PO/Item (&1/&2)
                                      message_v1 = movement-purchasing_document_number
                                      message_v2 = movement-item_number
                                      field = 'PURCHASING_DOCUMENT_NUMBER' ) ).
  ENDIF.



  "Données entête
  ls_goodsmvt_header-pstng_date = movement-posting_date. "Date comptable
  ls_goodsmvt_header-doc_date = movement-document_date.
  "ls_goodsmvt_header-ref_doc_no = is_po_input-delivery_note. "Bon de livraison
  "ls_goodsmvt_header-header_txt = is_po_input-document_header_text. "Note

  ASSIGN lt_po_items[ po_number = movement-purchasing_document_number
                      po_item   = movement-item_number ] TO FIELD-SYMBOL(<po_item>).
  IF sy-subrc <> 0. "Item doesn't exist
    RAISE EXCEPTION TYPE zcx_pm_good_receipt_error
      EXPORTING
        textid = zcx_pm_good_receipt_error=>item_number_not_found. "The item &ITEM_NUMBER& doesn't exist for PO &PURCHASE_ORDER&
  ENDIF.

  APPEND INITIAL LINE TO lt_goodsmvt_item[] ASSIGNING FIELD-SYMBOL(<goodsmvt_item>).
  <goodsmvt_item>-po_number = movement-purchasing_document_number.
  <goodsmvt_item>-po_item = movement-item_number.
  <goodsmvt_item>-plant = <po_item>-plant.       "Division

  "Emplacement de stockage
  <goodsmvt_item>-stge_loc = <po_item>-store_loc.
  IF movement-storage_location IS NOT INITIAL.
    <goodsmvt_item>-stge_loc = movement-storage_location.
  ENDIF.

  <goodsmvt_item>-move_type = '101'.   " Code mvt - Entrée de marchandise
  <goodsmvt_item>-mvt_ind = 'B'.
  <goodsmvt_item>-entry_qnt = movement-quantity.
  <goodsmvt_item>-line_id = 1.

  "Valuation Type / Catégorie de Valorisation
  IF ls_PurchaseOrderItem-ValuationCategory = 'X'.
    <goodsmvt_item>-val_type = movement-valuation_type.
  ENDIF.

  "Lot
  IF ls_PurchaseOrderItem-BatchManagement = abap_true.
    <goodsmvt_item>-batch = movement-batch_number.
  ENDIF.

  "Serial numbers
  IF ls_PurchaseOrderItem-SerialNumberProfile IS NOT INITIAL.
    DATA(lt_serial_numbers) = serial_numbers[].
    SORT lt_serial_numbers[] BY serial_number.
    DELETE ADJACENT DUPLICATES FROM lt_serial_numbers[] COMPARING serial_number.
    DELETE lt_serial_numbers[] WHERE serial_number IS INITIAL.

    LOOP AT lt_serial_numbers[] ASSIGNING FIELD-SYMBOL(<serial_number>).
      APPEND VALUE #( matdoc_itm = 1 serialno = |{ <serial_number>-serial_number ALPHA = OUT }| )  TO lt_goodsmvt_serialnumbers.
    ENDLOOP.
  ENDIF.

  CALL FUNCTION 'BAPI_GOODSMVT_CREATE'
    EXPORTING
      goodsmvt_header       = ls_goodsmvt_header
      goodsmvt_code         = '01' "GM_Code 01: Entrée de marchandises pour CA (Purchase Order)
      testrun               = movement-test_run
*     GOODSMVT_REF_EWM      =
    IMPORTING
      goodsmvt_headret      = ls_goodsmvt_headret
      materialdocument      = movement-material_document
      matdocumentyear       = movement-material_document_year
    TABLES
      goodsmvt_item         = lt_goodsmvt_item[]
      goodsmvt_serialnumber = lt_goodsmvt_serialnumbers[]
      return                = return[]
*     GOODSMVT_SERV_PART_DATA       =
*     EXTENSIONIN           =
    .

  "Mouvement d'entrée de marchandise effectué avec succès
  IF movement-material_document IS NOT INITIAL.
    movement-created = abap_true.
    APPEND VALUE #( type = 'S'
                    id = 'ZPM_MASS_RECEIPT'
                    number = 001 "Good receipt on PO/Item (&1/&2) successful : Doc number = &3/&4)
                    message_v1 = movement-purchasing_document_number
                    message_v2 = movement-item_number
                    message_v3 = movement-material_document
                    message_v4 = movement-material_document_year )
           TO return[].

    "Create log
    create_log( purchase_order         = movement-purchasing_document_number  " Purchasing Document Number
                purchase_order_item    = movement-item_number                 " Item Number of Purchasing Document
                display_currency       = movement-display_currency            " Display Currency
                quantity               = movement-quantity                    " Quantity
                unit_of_measure        = movement-unit_of_measure             " Base Unit of Measure
                valuation_type         = movement-valuation_type              " Valuation Type
                batch_number           = movement-batch_number                " Batch Number
                posting_date           = movement-posting_date                " Posting Date in the Document
                document_date          = movement-document_date               " Document Date in Document
                material_document      = movement-material_document           " Number of Material Document
                material_document_year = movement-material_document_year ).   " Material Document Year).
  ENDIF.

  IF line_exists( return[ type = 'E' ] ). "Erreur lors du chargement des pièces jointes
    RAISE EXCEPTION TYPE zcx_pm_good_receipt_error
      EXPORTING
*       textid           = zcx_pm_good_receipt_error=>zcx_pm_good_receipt_error
*       purchase_order   = movement-purchasing_document_number
*       item_number      = movement-item_number
        bapiret_messages = return[]
        field            = 'PURCHASING_DOCUMENT_NUMBER'.
  ENDIF.

ENDMETHOD.
ENDCLASS.
