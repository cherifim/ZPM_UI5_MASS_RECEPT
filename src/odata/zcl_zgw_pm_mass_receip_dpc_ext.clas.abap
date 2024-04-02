class ZCL_ZGW_PM_MASS_RECEIP_DPC_EXT definition
  public
  inheriting from ZCL_ZGW_PM_MASS_RECEIP_DPC
  create public .

public section.

  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CHANGESET_BEGIN
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CHANGESET_END
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CHANGESET_PROCESS
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_DEEP_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~DELETE_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITYSET
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~PATCH_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~UPDATE_ENTITY
    redefinition .
protected section.

  methods C_PURCHASEORDERI_GET_ENTITYSET
    redefinition .
  methods MOVEMENTSET_CREATE_ENTITY
    redefinition .
  methods MOVEMENTSET_DELETE_ENTITY
    redefinition .
  methods MOVEMENTSET_UPDATE_ENTITY
    redefinition .
private section.

  types:
    BEGIN OF tys_good_movement,
      data     TYPE zspm_mass_rcpt_movement_odata,
      _request TYPE /iwbep/if_mgw_appl_types=>ty_s_changeset_request,
    END OF tys_good_movement .
  types:
    tyt_good_movements TYPE STANDARD TABLE OF tys_good_movement .

  methods _PROCESS_CHANGES
    importing
      !IT_GOOD_MOVEMENTS type TYT_GOOD_MOVEMENTS
      !MAIN_MSG_CONTAINER type ref to /IWBEP/IF_MESSAGE_CONTAINER
    returning
      value(RT_CHANGESET_RESPONSE) type /IWBEP/IF_MGW_APPL_TYPES=>TY_T_CHANGESET_RESPONSE
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
ENDCLASS.



CLASS ZCL_ZGW_PM_MASS_RECEIP_DPC_EXT IMPLEMENTATION.


METHOD /iwbep/if_mgw_appl_srv_runtime~changeset_begin.
*______________________________________________________________________________________*
* Description:
* See object description
* Techname: ZCL_ZGW_PM_MASS_RECEIP_DPC_EXTCM002
*______________________________________________________________________________________*
* Date of creation: 21.03.2024 16:39:05  / Author: MCHERIFI / Mourad CHERIFI (STMS)
* Reference document:
*  Description : Set defer mode
*______________________________________________________________________________________*
* Historic of modifications
* Date / User name / Transport request / VYY-NN <Free>
* Description:
*______________________________________________________________________________________*

  SET UPDATE TASK LOCAL.
  cv_defer_mode = abap_true.

ENDMETHOD.


METHOD /iwbep/if_mgw_appl_srv_runtime~changeset_end.

  COMMIT WORK AND WAIT.

ENDMETHOD.


METHOD /iwbep/if_mgw_appl_srv_runtime~changeset_process.
*______________________________________________________________________________________*
* Description:
* See object description
* Techname: ZCL_ZGW_PM_MASS_RECEIP_DPC_EXTCM009
*______________________________________________________________________________________*
* Date of creation: 21.03.2024 17:37:05  / Author: MCHERIFI / Mourad CHERIFI (STMS)
* Reference document:
*  Description :
*______________________________________________________________________________________*
* Historic of modifications
* Date / User name / Transport request / VYY-NN <Free>
* Description:
*______________________________________________________________________________________*

  DATA: lo_request_context TYPE REF TO /iwbep/cl_mgw_request.
  DATA: lo_main_msg_container TYPE REF TO /iwbep/if_message_container.
  DATA: lr_data_ref TYPE REF TO data.
  DATA: ls_changeset_response TYPE /iwbep/if_mgw_appl_types=>ty_s_changeset_response.

  DATA: lt_good_movements TYPE tyt_good_movements.

  "Get connected supplier
  ASSIGN it_changeset_request[ 1 ] TO FIELD-SYMBOL(<changeset_req>).
  CHECK sy-subrc = 0.

  "Collect all changes of the change set
  LOOP AT it_changeset_request[] ASSIGNING <changeset_req>.

    lo_request_context ?= <changeset_req>-request_context.

    "Pick one message container that will be used for all generated messages
    IF lo_main_msg_container IS NOT BOUND.
      lo_main_msg_container = <changeset_req>-msg_container.
    ENDIF.

    DATA(lt_keys) = lo_request_context->get_request_details( )-key_tab[].

    FREE lr_data_ref.

    CASE <changeset_req>-operation_type.
      WHEN 'CD'. "CREATE DEEP
        me->/iwbep/if_mgw_appl_srv_runtime~create_deep_entity(
          EXPORTING
            iv_entity_name          = lo_request_context->get_request_details( )-source_entity
            iv_entity_set_name      = lo_request_context->get_request_details( )-source_entity_set
            iv_source_name          = lo_request_context->get_request_details( )-source_entity
            io_data_provider        = <changeset_req>-entry_provider
            it_key_tab              = lo_request_context->get_request_details( )-key_tab[]
            it_navigation_path      = lo_request_context->get_request_details( )-navigation_path
            io_expand               = <changeset_req>-expand_node
            io_tech_request_context = lo_request_context
          IMPORTING
            er_deep_entity          = lr_data_ref ).

      WHEN 'PE'. "MERGE
        "Calculate merged data (modified data from UI5 and current data in SAP)
        me->/iwbep/if_mgw_appl_srv_runtime~patch_entity(
          EXPORTING
            iv_entity_name               = lo_request_context->get_request_details( )-source_entity
            iv_entity_set_name           = lo_request_context->get_request_details( )-source_entity_set
            iv_source_name               = lo_request_context->get_request_details( )-source_entity
            io_data_provider             = <changeset_req>-entry_provider
            it_key_tab                   = lo_request_context->get_request_details( )-key_tab[]
            it_navigation_path           = lo_request_context->get_request_details( )-navigation_path
            io_tech_request_context      = lo_request_context
          IMPORTING
            er_entity                    = lr_data_ref ).

      WHEN 'UE'. "UPDATE
        me->/iwbep/if_mgw_appl_srv_runtime~update_entity(
          EXPORTING
            iv_entity_name               = lo_request_context->get_request_details( )-source_entity
            iv_entity_set_name           = lo_request_context->get_request_details( )-source_entity_set
            iv_source_name               = lo_request_context->get_request_details( )-source_entity
            io_data_provider             = <changeset_req>-entry_provider
            it_key_tab                   = lo_request_context->get_request_details( )-key_tab[]
            it_navigation_path           = lo_request_context->get_request_details( )-navigation_path
            io_tech_request_context      = lo_request_context
          IMPORTING
            er_entity                    = lr_data_ref ).

      WHEN 'CE'. "CREATE
        me->/iwbep/if_mgw_appl_srv_runtime~create_entity(
          EXPORTING
            iv_entity_name               = lo_request_context->get_request_details( )-source_entity
            iv_entity_set_name           = lo_request_context->get_request_details( )-source_entity_set
            iv_source_name               = lo_request_context->get_request_details( )-source_entity
            io_data_provider             = <changeset_req>-entry_provider
            it_key_tab                   = lo_request_context->get_request_details( )-key_tab[]
            it_navigation_path           = lo_request_context->get_request_details( )-navigation_path
            io_tech_request_context      = lo_request_context
          IMPORTING
            er_entity                    = lr_data_ref ).

      WHEN 'DE'. "DELETE
        me->/iwbep/if_mgw_appl_srv_runtime~delete_entity(
          EXPORTING
            iv_entity_name               = lo_request_context->get_request_details( )-source_entity
            iv_entity_set_name           = lo_request_context->get_request_details( )-source_entity_set
            iv_source_name               = lo_request_context->get_request_details( )-source_entity
            it_key_tab                   = lo_request_context->get_request_details( )-key_tab[]
            it_navigation_path           = lo_request_context->get_request_details( )-navigation_path
            io_tech_request_context      = lo_request_context ).

      WHEN OTHERS.
    ENDCASE.

    IF lr_data_ref IS BOUND.
      ASSIGN lr_data_ref->* TO FIELD-SYMBOL(<data>).
    ELSE.
      UNASSIGN <data>.
    ENDIF.

    DATA(lt_navigation_path) = lo_request_context->get_request_details( )-navigation_path.

    "Register the entity key (entity path) --> will be used for message generations with message targets in case of entity creations
    IF <changeset_req>-operation_type = 'CE' OR <changeset_req>-operation_type = 'CD'.
      ASSIGN COMPONENT '_ENTITY_PATH' OF STRUCTURE <data> TO FIELD-SYMBOL(<_entity_path>).
      IF sy-subrc = 0.
        zcl_odata_tools=>register_create_entity_path( content_id = lo_request_context->get_request_details( )-technical_request-batch_info-content_id
                                                      entity_path = <_entity_path> ).
      ENDIF.
    ENDIF.

    CASE lo_request_context->get_request_details( )-target_entity.

      WHEN 'GoodMovement'. "(Update only)
        APPEND INITIAL LINE TO lt_good_movements[] ASSIGNING FIELD-SYMBOL(<good_movement>). "Collect GoodMovement entities
        IF <data> IS ASSIGNED. "Data has been provided by the request
          MOVE-CORRESPONDING <data> TO <good_movement>-data.
        ENDIF.
        <good_movement>-_request = <changeset_req>.

      WHEN OTHERS.

        CLEAR: ls_changeset_response.
        ls_changeset_response-operation_no = <changeset_req>-operation_no.

        IF <data> IS ASSIGNED.
          copy_data_to_ref( EXPORTING is_data = <data>
                            CHANGING cr_data = ls_changeset_response-entity_data ).
        ENDIF.

        APPEND ls_changeset_response TO ct_changeset_response[].

    ENDCASE.

  ENDLOOP.

  ct_changeset_response[] = _process_changes( it_good_movements  = lt_good_movements[]
                                              main_msg_container = lo_main_msg_container ).


ENDMETHOD.


METHOD /iwbep/if_mgw_appl_srv_runtime~create_deep_entity.
*______________________________________________________________________________________*
* Description:
* See object description
* Techname: ZCL_ZGW_PM_MASS_RECEIP_DPC_EXTCM008
*______________________________________________________________________________________*
* Date of creation: 21.03.2024 16:50:25  / Author: MCHERIFI / Mourad CHERIFI (STMS)
* Reference document:
*  Description :  Create Deep
*______________________________________________________________________________________*
* Historic of modifications
* Date / User name / Transport request / VYY-NN <Free>
* Description:
*______________________________________________________________________________________*

  DATA: ls_mass_rcpt_movement TYPE zspm_mass_rcpt_movement_odata.

  IF iv_entity_name = 'GoodMovement'.
    io_data_provider->read_entry_data( IMPORTING es_data = ls_mass_rcpt_movement ).

    copy_data_to_ref( EXPORTING is_data = ls_mass_rcpt_movement
                      CHANGING cr_data = er_deep_entity ).
    RETURN.
  ENDIF.

  super->/iwbep/if_mgw_appl_srv_runtime~create_deep_entity(
    EXPORTING
      iv_entity_name          = iv_entity_name                          " Obsolete
      iv_entity_set_name      = iv_entity_set_name                      " Obsolete
      iv_source_name          = iv_source_name                          " Obsolete
      io_data_provider        = io_data_provider                        " MGW Entry Data Provider
      it_key_tab              = it_key_tab                              " table for name value pairs Obsolete
      it_navigation_path      = it_navigation_path                      " table of navigation paths Obsolete
      io_expand               = io_expand                               " Expand Comparator Interface
      io_tech_request_context = io_tech_request_context                 " Request Details for Entity Create Operation
    IMPORTING
      er_deep_entity          = er_deep_entity
  ).

ENDMETHOD.


METHOD /iwbep/if_mgw_appl_srv_runtime~create_entity.
*______________________________________________________________________________________*
* Description:
* See object description
* Techname: ZCL_ZGW_PM_MASS_RECEIP_DPC_EXTCM00A
*______________________________________________________________________________________*
* Date of creation: 21.03.2024 17:55:07  / Author: MCHERIFI / Mourad CHERIFI (STMS)
* Reference document:
*  Description : Redefine CREATE_ENTITY to implement some custom pre- and post-processing
*______________________________________________________________________________________*
* Historic of modifications
* Date / User name / Transport request / VYY-NN <Free>
* Description:
*______________________________________________________________________________________*

  "Initialize OData helper class
  zcl_odata_tools=>set_default_message_container( me->mo_context->get_message_container( ) ).
  zcl_odata_tools=>set_default_request_context( CAST #( io_tech_request_context ) ).

  CALL METHOD super->/iwbep/if_mgw_appl_srv_runtime~create_entity
    EXPORTING
      iv_entity_name          = iv_entity_name
      iv_entity_set_name      = iv_entity_set_name
      iv_source_name          = iv_source_name
      io_data_provider        = io_data_provider
      it_key_tab              = it_key_tab
      it_navigation_path      = it_navigation_path
      io_tech_request_context = io_tech_request_context
    IMPORTING
      er_entity               = er_entity.

ENDMETHOD.


METHOD /iwbep/if_mgw_appl_srv_runtime~delete_entity.
*______________________________________________________________________________________*
* Description:
* See object description
* Techname: ZCL_ZGW_PM_MASS_RECEIP_DPC_EXTCM00B
*______________________________________________________________________________________*
* Date of creation: 21.03.2024 17:56:24  / Author: MCHERIFI / Mourad CHERIFI (STMS)
* Reference document:
*  Description : Redefine DELETE_ENTITY to implement some custom pre- and post-processing
*______________________________________________________________________________________*
* Historic of modifications
* Date / User name / Transport request / VYY-NN <Free>
* Description:
*______________________________________________________________________________________*

  "Initialize OData helper class
  zcl_odata_tools=>set_default_message_container( me->mo_context->get_message_container( ) ).
  zcl_odata_tools=>set_default_request_context( CAST #( io_tech_request_context ) ).


  CALL METHOD super->/iwbep/if_mgw_appl_srv_runtime~delete_entity
    EXPORTING
      iv_entity_name          = iv_entity_name
      iv_entity_set_name      = iv_entity_set_name
      iv_source_name          = iv_source_name
      it_key_tab              = it_key_tab
      it_navigation_path      = it_navigation_path
      io_tech_request_context = io_tech_request_context.

ENDMETHOD.


METHOD /iwbep/if_mgw_appl_srv_runtime~get_entity.
*______________________________________________________________________________________*
* Description:
* See object description
* Techname: ZCL_ZGW_PM_MASS_RECEIP_DPC_EXTCM00C
*______________________________________________________________________________________*
* Date of creation: 21.03.2024 17:57:19  / Author: MCHERIFI / Mourad CHERIFI (STMS)
* Reference document:
*  Description :  Redefine GET_ENTITY to implement some custom pre- and post-processing
*______________________________________________________________________________________*
* Historic of modifications
* Date / User name / Transport request / VYY-NN <Free>
* Description:
*______________________________________________________________________________________*

  "Initialize OData helper class
  zcl_odata_tools=>set_default_message_container( me->mo_context->get_message_container( ) ).
  zcl_odata_tools=>set_default_request_context( CAST #( io_tech_request_context ) ).

  CALL METHOD super->/iwbep/if_mgw_appl_srv_runtime~get_entity
    EXPORTING
      iv_entity_name          = iv_entity_name
      iv_entity_set_name      = iv_entity_set_name
      iv_source_name          = iv_source_name
      it_key_tab              = it_key_tab
      it_navigation_path      = it_navigation_path
      io_tech_request_context = io_tech_request_context
    IMPORTING
      er_entity               = er_entity
      es_response_context     = es_response_context.


ENDMETHOD.


METHOD /iwbep/if_mgw_appl_srv_runtime~get_entityset.
*______________________________________________________________________________________*
* Description:
* See object description
* Techname: ZCL_ZGW_PM_MASS_RECEIP_DPC_EXTCM00D
*______________________________________________________________________________________*
* Date of creation: 21.03.2024 17:58:28  / Author: MCHERIFI / Mourad CHERIFI (STMS)
* Reference document:
*  Description : Redefine GET_ENTOTYSET to implement some custom pre- and post-processing
*______________________________________________________________________________________*
* Historic of modifications
* Date / User name / Transport request / VYY-NN <Free>
* Description:
*______________________________________________________________________________________*

  FIELD-SYMBOLS: <entities_table> TYPE table.

  "Initialize OData helper class
  zcl_odata_tools=>set_default_message_container( me->mo_context->get_message_container( ) ).
  zcl_odata_tools=>set_default_request_context( CAST #( io_tech_request_context ) ).

  CALL METHOD super->/iwbep/if_mgw_appl_srv_runtime~get_entityset
    EXPORTING
      iv_entity_name           = iv_entity_name
      iv_entity_set_name       = iv_entity_set_name
      iv_source_name           = iv_source_name
      it_filter_select_options = it_filter_select_options
      it_order                 = it_order
      is_paging                = is_paging
      it_navigation_path       = it_navigation_path
      it_key_tab               = it_key_tab
      iv_filter_string         = iv_filter_string
      iv_search_string         = iv_search_string
      io_tech_request_context  = io_tech_request_context
    IMPORTING
      er_entityset             = er_entityset
      es_response_context      = es_response_context.

  ASSIGN er_entityset->* TO <entities_table>.

  "Manage $inlinecount query option
  IF io_tech_request_context->has_inlinecount( ) = abap_true.
    es_response_context-inlinecount = lines( <entities_table> ).
  ENDIF.

  "Apply sorting
  zcl_odata_tools=>apply_sorters( EXPORTING it_order     = it_order[]
                                            io_request_context = CAST #( io_tech_request_context )
                                  CHANGING  et_entityset = <entities_table> ).

ENDMETHOD.


METHOD /iwbep/if_mgw_appl_srv_runtime~patch_entity.
*______________________________________________________________________________________*
* Description:
* See object description
* Techname: ZCL_ZGW_PM_MASS_RECEIP_DPC_EXTCM00E
*______________________________________________________________________________________*
* Date of creation: 21.03.2024 17:59:18  / Author: MCHERIFI / Mourad CHERIFI (STMS)
* Reference document:
*  Description :  Redefine PATCH_ENTITY to implement some custom pre- and post-processing
*______________________________________________________________________________________*
* Historic of modifications
* Date / User name / Transport request / VYY-NN <Free>
* Description:
*______________________________________________________________________________________*

  "Initialize OData helper class
  zcl_odata_tools=>set_default_message_container( me->mo_context->get_message_container( ) ).
  zcl_odata_tools=>set_default_request_context( CAST #( io_tech_request_context ) ).

  CALL METHOD super->/iwbep/if_mgw_appl_srv_runtime~patch_entity
    EXPORTING
      iv_entity_name          = iv_entity_name
      iv_entity_set_name      = iv_entity_set_name
      iv_source_name          = iv_source_name
      io_data_provider        = io_data_provider
      it_key_tab              = it_key_tab
      it_navigation_path      = it_navigation_path
      io_tech_request_context = io_tech_request_context
    IMPORTING
      er_entity               = er_entity.


ENDMETHOD.


METHOD /iwbep/if_mgw_appl_srv_runtime~update_entity.
*______________________________________________________________________________________*
* Description:
* See object description
* Techname: ZCL_ZGW_PM_MASS_RECEIP_DPC_EXTCM00F
*______________________________________________________________________________________*
* Date of creation: 21.03.2024 17:59:58  / Author: MCHERIFI / Mourad CHERIFI (STMS)
* Reference document:
*  Description :  Redefine UPDATE_ENTITY to implement some custom pre- and post-processing
*______________________________________________________________________________________*
* Historic of modifications
* Date / User name / Transport request / VYY-NN <Free>
* Description:
*______________________________________________________________________________________*

  "Initialize OData helper class
  zcl_odata_tools=>set_default_message_container( me->mo_context->get_message_container( ) ).
  zcl_odata_tools=>set_default_request_context( CAST #( io_tech_request_context ) ).

  CALL METHOD super->/iwbep/if_mgw_appl_srv_runtime~update_entity
    EXPORTING
      iv_entity_name          = iv_entity_name
      iv_entity_set_name      = iv_entity_set_name
      iv_source_name          = iv_source_name
      io_data_provider        = io_data_provider
      it_key_tab              = it_key_tab
      it_navigation_path      = it_navigation_path
      io_tech_request_context = io_tech_request_context
    IMPORTING
      er_entity               = er_entity.

ENDMETHOD.


METHOD c_purchaseorderi_get_entityset.
*______________________________________________________________________________________*
* Description:
* See object description
* Techname: ZCL_ZGW_PM_MASS_RECEIP_DPC_EXTCM001
*______________________________________________________________________________________*
* Date of creation: 15.03.2024 16:38:02  / Author: MCHERIFI / Mourad CHERIFI (STMS)
* Reference document:
*  Description :  Add some filters to the selection
*______________________________________________________________________________________*
* Historic of modifications
* Date / User name / Transport request / VYY-NN <Free>
* Description:
*______________________________________________________________________________________*

  super->c_purchaseorderi_get_entityset(
    EXPORTING
      iv_entity_name           = iv_entity_name
      iv_entity_set_name       = iv_entity_set_name
      iv_source_name           = iv_source_name
      it_filter_select_options = it_filter_select_options
      is_paging                = is_paging
      it_key_tab               = it_key_tab
      it_navigation_path       = it_navigation_path
      it_order                 = it_order
      iv_filter_string         = iv_filter_string
      iv_search_string         = iv_search_string
      io_tech_request_context  = io_tech_request_context
    IMPORTING
      et_entityset             = et_entityset
      es_response_context      = es_response_context ).

*  DELETE et_entityset[] WHERE IsCompletelyDelivered = abap_true.
*  DELETE et_entityset[] WHERE StillToBeDeliveredQuantity <= 0.


ENDMETHOD.


METHOD movementset_create_entity.

  "Not implemented - see CHANGESET_PROCESS
  io_data_provider->read_entry_data( IMPORTING es_data = er_entity ).

  "Fill key components from request key table in case of creation through navigational property
  zcl_odata_tools=>fill_key_fields( EXPORTING  io_request_context = CAST #( io_tech_request_context )
                                    CHANGING   ct_entity = er_entity ).

ENDMETHOD.


METHOD movementset_delete_entity.
  "Not implemented - see CHANGESET_PROCESS
ENDMETHOD.


METHOD _process_changes.
*______________________________________________________________________________________*
* Description:
* See object description
* Techname: ZCL_ZGW_PM_MASS_RECEIP_DPC_EXTCM00I
*______________________________________________________________________________________*
* Date of creation: 22.03.2024 15:10:30  / Author: MCHERIFI / Mourad CHERIFI (STMS)
* Reference document:
*  Description :  process all changes
*______________________________________________________________________________________*
* Historic of modifications
* Date / User name / Transport request / VYY-NN <Free>
* Description:
*______________________________________________________________________________________*

  DATA: lt_changeset_response TYPE STANDARD TABLE OF /iwbep/if_mgw_appl_types=>ty_s_changeset_response.
  DATA: lo_request_context TYPE REF TO /iwbep/cl_mgw_request.
  DATA: lt_messages TYPE STANDARD TABLE OF bapiret2.
  DATA: ls_good_movement TYPE zspm_mass_rcpt_movement.
  DATA: lt_serial_numbers TYPE ztpm_mass_rcpt_ser_num.
  DATA: ls_good_movement_odata TYPE zspm_mass_rcpt_movement_odata.

  "Build response data (default response data = request data)
  LOOP AT it_good_movements[] ASSIGNING FIELD-SYMBOL(<good_movement>).
    APPEND INITIAL LINE TO lt_changeset_response[] ASSIGNING FIELD-SYMBOL(<change_response>).
    <change_response>-operation_no = <good_movement>-_request-operation_no.
    copy_data_to_ref( EXPORTING is_data = <good_movement>-data
                      CHANGING  cr_data = <change_response>-entity_data ).
  ENDLOOP.
  rt_changeset_response[] = lt_changeset_response[].


  TRY.
      "Excecute good movements
      LOOP AT it_good_movements[] ASSIGNING <good_movement>.
        ls_good_movement_odata = <good_movement>-data.
        lo_request_context ?= <good_movement>-_request-request_context.
        CLEAR ls_good_movement.
        MOVE-CORRESPONDING <good_movement>-data TO ls_good_movement.
        ls_good_movement-_request_context = lo_request_context.

        lt_serial_numbers[] = <good_movement>-data-_serialnumbers[].
        CASE <good_movement>-_request-operation_type.
          WHEN 'CE' OR 'CD'. "Creation
            "Check input data
            zcl_pm_mass_receipt_helper=>check_good_receipt_data( movement = ls_good_movement
                                                                 serial_numbers = lt_serial_numbers[] ).
            "Execute good receipt
            DATA(lt_return) = zcl_pm_mass_receipt_helper=>perform_good_receipt( CHANGING movement = ls_good_movement
                                                                                         serial_numbers = lt_serial_numbers[] ).

            "Success message
            zcl_odata_tools=>add_messages_from_bapi( it_bapi_messages = lt_return[]
                                                     io_message_container = main_msg_container
                                                     io_request_context = lo_request_context
                                                     iv_add_to_response_header = abap_true
                                                     iv_transient = abap_true ).

            MOVE-CORRESPONDING ls_good_movement TO ls_good_movement_odata.

            "Update data in changeset response data
            ASSIGN rt_changeset_response[ operation_no = <good_movement>-_request-operation_no ] TO <change_response>.
            IF sy-subrc = 0.
              copy_data_to_ref( EXPORTING is_data = ls_good_movement_odata
                                CHANGING  cr_data = <change_response>-entity_data ).
            ENDIF.

          WHEN OTHERS.
        ENDCASE.
      ENDLOOP.

    CATCH zcx_pm_mass_rcpt_validation INTO DATA(lx_data_validation).
      ROLLBACK WORK.

      "Take the context provided by the exception
      IF lx_data_validation->odatav2_request_context IS BOUND.
        lo_request_context = lx_data_validation->odatav2_request_context.
      ENDIF.

      "Data validation messages containing possibly the original requests contexts
      LOOP AT lx_data_validation->get_validation_messages( ) ASSIGNING FIELD-SYMBOL(<validation_msg>).

        IF <validation_msg>-request_context IS BOUND. "Take the context provided by the message
          lo_request_context = <validation_msg>-request_context.
        ENDIF.
        "Multi-Targets
        IF <validation_msg>-fields[] IS NOT INITIAL.
          LOOP AT <validation_msg>-fields[] ASSIGNING FIELD-SYMBOL(<field>).
            <validation_msg>-bapiret_msg-field = <field>.
            zcl_odata_tools=>add_messages_from_bapi( it_bapi_messages      = VALUE #( ( <validation_msg>-bapiret_msg  ) )
                                                     io_message_container  = main_msg_container
                                                     io_request_context    = lo_request_context
                                                     iv_transient          = abap_false ).
          ENDLOOP.
        ELSE.
          zcl_odata_tools=>add_messages_from_bapi( it_bapi_messages      = VALUE #( ( <validation_msg>-bapiret_msg  ) )
                                                   io_message_container  = main_msg_container
                                                   io_request_context    = lo_request_context
                                                   iv_transient          = abap_false ).
        ENDIF.

      ENDLOOP.

      APPEND LINES OF lx_data_validation->get_bapiret2_messages( ) TO lt_messages[].
      IF lt_messages[] IS NOT INITIAL.
        zcl_odata_tools=>add_messages_from_bapi( it_bapi_messages = lt_messages[]
                                                 iv_add_to_response_header = abap_false
                                                 iv_is_leading_message     = abap_true
                                                 io_message_container      = main_msg_container
                                                 io_request_context        = lo_request_context
                                                 iv_transient              = abap_false ).
      ENDIF.

      RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
        EXPORTING
          message_container = main_msg_container.

    CATCH zcx_pm_mass_receipt_exception INTO DATA(lx_exception).

      ROLLBACK WORK.

      IF lx_exception->odatav2_request_context IS BOUND.
        lo_request_context = lx_exception->odatav2_request_context.
      ENDIF.

      APPEND LINES OF lx_exception->get_bapiret2_messages( ) TO lt_messages[].

      zcl_odata_tools=>raise_busi_exception_from_bapi( it_bapi_messages = lt_messages[]
                                                       io_message_container  = main_msg_container
                                                       io_request_context = lo_request_context
                                                       iv_add_to_response_header = abap_true
                                                       iv_is_leading_message = abap_true
                                                       iv_transient = abap_false ).

    CATCH cx_root INTO DATA(lx_root). "Any other unexpected exception
      ROLLBACK WORK.

      APPEND VALUE #( id = 'ZPP_IMP_MSG'
                      type = 'E'
                      number = 000 "An error has occurred: &1 &2 &3 &4 / Une erreur est survenue : &1 &2 &3 &4
                      message_v1 = lx_root->get_text( )
                      field = 'PURCHASING_DOCUMENT_NUMBER' ) TO lt_messages[].

      zcl_odata_tools=>raise_busi_exception_from_bapi( it_bapi_messages = lt_messages[]
                                                       io_message_container  = main_msg_container
                                                       io_request_context = lo_request_context
                                                       iv_add_to_response_header = abap_true
                                                       iv_is_leading_message = abap_true
                                                       iv_transient = abap_false ).

  ENDTRY.



ENDMETHOD.


method MOVEMENTSET_UPDATE_ENTITY.
  "No update on entity GoodMovement
endmethod.
ENDCLASS.
