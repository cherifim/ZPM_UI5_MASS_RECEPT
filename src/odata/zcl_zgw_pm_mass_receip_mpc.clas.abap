class ZCL_ZGW_PM_MASS_RECEIP_MPC definition
  public
  inheriting from /IWBEP/CL_MGW_PUSH_ABS_MODEL
  create public .

public section.

  interfaces IF_SADL_GW_MODEL_EXPOSURE_DATA .

  types:
     TS_SERIALNUMBER type ZSPM_MASS_RCPT_SER_NUM_ODATA .
  types:
TT_SERIALNUMBER type standard table of TS_SERIALNUMBER .
  types:
   begin of ts_text_element,
      artifact_name  type c length 40,       " technical name
      artifact_type  type c length 4,
      parent_artifact_name type c length 40, " technical name
      parent_artifact_type type c length 4,
      text_symbol    type textpoolky,
   end of ts_text_element .
  types:
         tt_text_elements type standard table of ts_text_element with key text_symbol .
  types:
     TS_GOODMOVEMENT type ZSPM_MASS_RCPT_MOVEMENT_ODATA .
  types:
TT_GOODMOVEMENT type standard table of TS_GOODMOVEMENT .
  types:
  begin of TS_VALUATIONTYPESH,
     BWTAR type BWTAR_D,
  end of TS_VALUATIONTYPESH .
  types:
TT_VALUATIONTYPESH type standard table of TS_VALUATIONTYPESH .
  types:
  begin of TS_STORAGELOCATIONSH,
     WERKS type WERKS_D,
     LGORT type LGORT_D,
     LGOBE type LGOBE,
  end of TS_STORAGELOCATIONSH .
  types:
TT_STORAGELOCATIONSH type standard table of TS_STORAGELOCATIONSH .
  types:
    begin of TS_C_MASSUPDTPURORDVHTYPE.
      include type C_MASSUPDTPURORDVH.
  types:
    end of TS_C_MASSUPDTPURORDVHTYPE .
  types:
   TT_C_MASSUPDTPURORDVHTYPE type standard table of TS_C_MASSUPDTPURORDVHTYPE .
  types:
    begin of TS_C_MATLDOCOVWCHARVALUEVHTYPE.
      include type C_MATLDOCOVWCHARVALUEVH.
  types:
    end of TS_C_MATLDOCOVWCHARVALUEVHTYPE .
  types:
   TT_C_MATLDOCOVWCHARVALUEVHTYPE type standard table of TS_C_MATLDOCOVWCHARVALUEVHTYPE .
  types:
    begin of TS_C_MM_ACCOUNTASSIGNCATVALUEH.
      include type C_MM_ACCOUNTASSIGNCATVALUEHELP.
  types:
    end of TS_C_MM_ACCOUNTASSIGNCATVALUEH .
  types:
   TT_C_MM_ACCOUNTASSIGNCATVALUEH type standard table of TS_C_MM_ACCOUNTASSIGNCATVALUEH .
  types:
    begin of TS_C_MM_COMPANYCODEVALUEHELPTY.
      include type C_MM_COMPANYCODEVALUEHELP.
  types:
    end of TS_C_MM_COMPANYCODEVALUEHELPTY .
  types:
   TT_C_MM_COMPANYCODEVALUEHELPTY type standard table of TS_C_MM_COMPANYCODEVALUEHELPTY .
  types:
    begin of TS_C_MM_MATERIALGROUPVALUEHELP.
      include type C_MM_MATERIALGROUPVALUEHELP.
  types:
    end of TS_C_MM_MATERIALGROUPVALUEHELP .
  types:
   TT_C_MM_MATERIALGROUPVALUEHELP type standard table of TS_C_MM_MATERIALGROUPVALUEHELP .
  types:
    begin of TS_C_MM_MATERIALVALUEHELPTYPE.
      include type C_MM_MATERIALVALUEHELP.
  types:
    end of TS_C_MM_MATERIALVALUEHELPTYPE .
  types:
   TT_C_MM_MATERIALVALUEHELPTYPE type standard table of TS_C_MM_MATERIALVALUEHELPTYPE .
  types:
    begin of TS_C_MM_PLANTVALUEHELPTYPE.
      include type C_MM_PLANTVALUEHELP.
  types:
    end of TS_C_MM_PLANTVALUEHELPTYPE .
  types:
   TT_C_MM_PLANTVALUEHELPTYPE type standard table of TS_C_MM_PLANTVALUEHELPTYPE .
  types:
    begin of TS_C_MM_SERVICEPERFORMERVALUEH.
      include type C_MM_SERVICEPERFORMERVALUEHELP.
  types:
    end of TS_C_MM_SERVICEPERFORMERVALUEH .
  types:
   TT_C_MM_SERVICEPERFORMERVALUEH type standard table of TS_C_MM_SERVICEPERFORMERVALUEH .
  types:
    begin of TS_C_MM_SMPLSUPPLIERVALUEHELPT.
      include type C_MM_SMPLSUPPLIERVALUEHELP.
  types:
    end of TS_C_MM_SMPLSUPPLIERVALUEHELPT .
  types:
   TT_C_MM_SMPLSUPPLIERVALUEHELPT type standard table of TS_C_MM_SMPLSUPPLIERVALUEHELPT .
  types:
    begin of TS_C_MM_STORLOCVALUEHELPTYPE.
      include type C_MM_STORLOCVALUEHELP.
  types:
    end of TS_C_MM_STORLOCVALUEHELPTYPE .
  types:
   TT_C_MM_STORLOCVALUEHELPTYPE type standard table of TS_C_MM_STORLOCVALUEHELPTYPE .
  types:
    begin of TS_C_POITEMINTERNALSTATUSVH_2T.
      include type C_POITEMINTERNALSTATUSVH_2.
  types:
    end of TS_C_POITEMINTERNALSTATUSVH_2T .
  types:
   TT_C_POITEMINTERNALSTATUSVH_2T type standard table of TS_C_POITEMINTERNALSTATUSVH_2T .
  types:
    begin of TS_C_POITEMNEXTDELIVERYSTATUSV.
      include type C_POITEMNEXTDELIVERYSTATUSVH.
  types:
    end of TS_C_POITEMNEXTDELIVERYSTATUSV .
  types:
   TT_C_POITEMNEXTDELIVERYSTATUSV type standard table of TS_C_POITEMNEXTDELIVERYSTATUSV .
  types:
    begin of TS_C_POITEMNEXTDELIVERYVALUEHE.
      include type C_POITEMNEXTDELIVERYVALUEHELP.
  types:
    end of TS_C_POITEMNEXTDELIVERYVALUEHE .
  types:
   TT_C_POITEMNEXTDELIVERYVALUEHE type standard table of TS_C_POITEMNEXTDELIVERYVALUEHE .
  types:
    begin of TS_C_POITEMORDERTYPEVALUEHELPT.
      include type C_POITEMORDERTYPEVALUEHELP.
  types:
    end of TS_C_POITEMORDERTYPEVALUEHELPT .
  types:
   TT_C_POITEMORDERTYPEVALUEHELPT type standard table of TS_C_POITEMORDERTYPEVALUEHELPT .
  types:
    begin of TS_C_POITEMPRODUCTTYPEVALUEHEL.
      include type C_POITEMPRODUCTTYPEVALUEHELP.
  types:
    end of TS_C_POITEMPRODUCTTYPEVALUEHEL .
  types:
   TT_C_POITEMPRODUCTTYPEVALUEHEL type standard table of TS_C_POITEMPRODUCTTYPEVALUEHEL .
  types:
    begin of TS_C_PRODUCTSEASONYEARVHTYPE.
      include type C_PRODUCTSEASONYEARVH.
  types:
      T_PRODUCTSEASONYEAR type I_PRODUCTSEASONSTEXT-PRODUCTSEASONTEXT,
    end of TS_C_PRODUCTSEASONYEARVHTYPE .
  types:
   TT_C_PRODUCTSEASONYEARVHTYPE type standard table of TS_C_PRODUCTSEASONYEARVHTYPE .
  types:
    begin of TS_C_PRODUCTUNITOFMEASUREVHTYP.
      include type C_PRODUCTUNITOFMEASUREVH.
  types:
      T_UNITOFMEASURE type I_UNITOFMEASURETEXT-UNITOFMEASURELONGNAME,
    end of TS_C_PRODUCTUNITOFMEASUREVHTYP .
  types:
   TT_C_PRODUCTUNITOFMEASUREVHTYP type standard table of TS_C_PRODUCTUNITOFMEASUREVHTYP .
  types:
    begin of TS_C_PURCHASECONTRACTVALHELPTY.
      include type C_PURCHASECONTRACTVALHELP.
  types:
    end of TS_C_PURCHASECONTRACTVALHELPTY .
  types:
   TT_C_PURCHASECONTRACTVALHELPTY type standard table of TS_C_PURCHASECONTRACTVALHELPTY .
  types:
    begin of TS_C_PURCHASEORDERITEMMONIPARA.
      include type C_PURCHASEORDERITEMMONI.
  types:
      generated_id type string,
      P_DISPLAYCURRENCY type VDM_V_DISPLAY_CURRENCY,
    end of TS_C_PURCHASEORDERITEMMONIPARA .
  types:
   TT_C_PURCHASEORDERITEMMONIPARA type standard table of TS_C_PURCHASEORDERITEMMONIPARA .
  types:
    begin of TS_C_PURCHASEORDERITEMMONIRESU.
      include type C_PURCHASEORDERITEMMONI.
  types:
      generated_id type string,
      P_DISPLAYCURRENCY type VDM_V_DISPLAY_CURRENCY,
    end of TS_C_PURCHASEORDERITEMMONIRESU .
  types:
   TT_C_PURCHASEORDERITEMMONIRESU type standard table of TS_C_PURCHASEORDERITEMMONIRESU .
  types:
    begin of TS_C_PURCHASEREQUISITIONVALUEH.
      include type C_PURCHASEREQUISITIONVALUEHELP.
  types:
      T_MATERIAL type I_MATERIALTEXT-MATERIALNAME,
    end of TS_C_PURCHASEREQUISITIONVALUEH .
  types:
   TT_C_PURCHASEREQUISITIONVALUEH type standard table of TS_C_PURCHASEREQUISITIONVALUEH .
  types:
    begin of TS_C_PURCHASINGCATEGORYVALUEHE.
      include type C_PURCHASINGCATEGORYVALUEHELP.
  types:
    end of TS_C_PURCHASINGCATEGORYVALUEHE .
  types:
   TT_C_PURCHASINGCATEGORYVALUEHE type standard table of TS_C_PURCHASINGCATEGORYVALUEHE .
  types:
    begin of TS_C_PURCHASINGGROUPVALUEHELPT.
      include type C_PURCHASINGGROUPVALUEHELP.
  types:
    end of TS_C_PURCHASINGGROUPVALUEHELPT .
  types:
   TT_C_PURCHASINGGROUPVALUEHELPT type standard table of TS_C_PURCHASINGGROUPVALUEHELPT .
  types:
    begin of TS_C_PURCHASINGORGVALUEHELPTYP.
      include type C_PURCHASINGORGVALUEHELP.
  types:
    end of TS_C_PURCHASINGORGVALUEHELPTYP .
  types:
   TT_C_PURCHASINGORGVALUEHELPTYP type standard table of TS_C_PURCHASINGORGVALUEHELPTYP .
  types:
    begin of TS_C_PURDOCITEMCATEGORYVALUEHE.
      include type C_PURDOCITEMCATEGORYVALUEHELP.
  types:
    end of TS_C_PURDOCITEMCATEGORYVALUEHE .
  types:
   TT_C_PURDOCITEMCATEGORYVALUEHE type standard table of TS_C_PURDOCITEMCATEGORYVALUEHE .
  types:
    begin of TS_C_PURDOCITMSTOCKSEGMENTVHTY.
      include type C_PURDOCITMSTOCKSEGMENTVH.
  types:
    end of TS_C_PURDOCITMSTOCKSEGMENTVHTY .
  types:
   TT_C_PURDOCITMSTOCKSEGMENTVHTY type standard table of TS_C_PURDOCITMSTOCKSEGMENTVHTY .
  types:
    begin of TS_C_RFQVALUEHELPTYPE.
      include type C_RFQVALUEHELP.
  types:
      T_REQUESTFORQUOTATION type I_PURCHASINGDOCUMENTTYPETEXT-PURCHASINGDOCUMENTTYPENAME,
    end of TS_C_RFQVALUEHELPTYPE .
  types:
   TT_C_RFQVALUEHELPTYPE type standard table of TS_C_RFQVALUEHELPTYPE .
  types:
    begin of TS_E_PURCHASINGDOCUMENTITEMTYP.
      include type E_PURCHASINGDOCUMENTITEM.
  types:
    end of TS_E_PURCHASINGDOCUMENTITEMTYP .
  types:
   TT_E_PURCHASINGDOCUMENTITEMTYP type standard table of TS_E_PURCHASINGDOCUMENTITEMTYP .
  types:
    begin of TS_I_COMPANYCODESTDVHTYPE.
      include type I_COMPANYCODESTDVH.
  types:
    end of TS_I_COMPANYCODESTDVHTYPE .
  types:
   TT_I_COMPANYCODESTDVHTYPE type standard table of TS_I_COMPANYCODESTDVHTYPE .
  types:
    begin of TS_I_CURRENCYTYPE.
      include type I_CURRENCY.
  types:
      T_CURRENCY type I_CURRENCYTEXT-CURRENCYNAME,
    end of TS_I_CURRENCYTYPE .
  types:
   TT_I_CURRENCYTYPE type standard table of TS_I_CURRENCYTYPE .
  types:
    begin of TS_I_CUSTOMER_VHTYPE.
      include type I_CUSTOMER_VH.
  types:
    end of TS_I_CUSTOMER_VHTYPE .
  types:
   TT_I_CUSTOMER_VHTYPE type standard table of TS_I_CUSTOMER_VHTYPE .
  types:
    begin of TS_I_MATERIALSTDVHTYPE.
      include type I_MATERIALSTDVH.
  types:
      T_MATERIAL type I_MATERIALTEXT-MATERIALNAME,
    end of TS_I_MATERIALSTDVHTYPE .
  types:
   TT_I_MATERIALSTDVHTYPE type standard table of TS_I_MATERIALSTDVHTYPE .
  types:
    begin of TS_I_PLANTTYPE.
      include type I_PLANT.
  types:
    end of TS_I_PLANTTYPE .
  types:
   TT_I_PLANTTYPE type standard table of TS_I_PLANTTYPE .
  types:
    begin of TS_I_PROCMTSUPLRDELIVFORECASTT.
      include type I_PROCMTSUPLRDELIVFORECAST.
  types:
      T_PREDICTEDDELDAYSRLTN_14F663B type I_PROCMTSUPLRDELIVFORECASTTEXT-DOMAINTEXT,
    end of TS_I_PROCMTSUPLRDELIVFORECASTT .
  types:
   TT_I_PROCMTSUPLRDELIVFORECASTT type standard table of TS_I_PROCMTSUPLRDELIVFORECASTT .
  types:
    begin of TS_I_PRODUCTVHTYPE.
      include type I_PRODUCTVH.
  types:
      T_PRODUCT type I_PRODUCTDESCRIPTION-PRODUCTDESCRIPTION,
    end of TS_I_PRODUCTVHTYPE .
  types:
   TT_I_PRODUCTVHTYPE type standard table of TS_I_PRODUCTVHTYPE .
  types:
    begin of TS_I_PURCHASINGINFORECORDSTDVH.
      include type I_PURCHASINGINFORECORDSTDVH.
  types:
    end of TS_I_PURCHASINGINFORECORDSTDVH .
  types:
   TT_I_PURCHASINGINFORECORDSTDVH type standard table of TS_I_PURCHASINGINFORECORDSTDVH .
  types:
    begin of TS_I_SUPPLIER_VHTYPE.
      include type I_SUPPLIER_VH.
  types:
    end of TS_I_SUPPLIER_VHTYPE .
  types:
   TT_I_SUPPLIER_VHTYPE type standard table of TS_I_SUPPLIER_VHTYPE .
  types:
    begin of TS_ZC_PM_MASSRECEIPTLOGTYPE.
      include type ZC_PM_MASSRECEIPTLOG.
  types:
    end of TS_ZC_PM_MASSRECEIPTLOGTYPE .
  types:
   TT_ZC_PM_MASSRECEIPTLOGTYPE type standard table of TS_ZC_PM_MASSRECEIPTLOGTYPE .
  types:
    begin of TS_ZC_PM_PURCHASEORDERITEMMONI.
      include type ZC_PM_PURCHASEORDERITEMMONI.
  types:
      P_DISPLAYCURRENCY type VDM_V_DISPLAY_CURRENCY,
    end of TS_ZC_PM_PURCHASEORDERITEMMONI .
  types:
   TT_ZC_PM_PURCHASEORDERITEMMONI type standard table of TS_ZC_PM_PURCHASEORDERITEMMONI .
  types:
    begin of TS_ZC_PM_PURCHASEORDERITEMMON.
      include type ZC_PM_PURCHASEORDERITEMMONI.
  types:
      P_DISPLAYCURRENCY type VDM_V_DISPLAY_CURRENCY,
    end of TS_ZC_PM_PURCHASEORDERITEMMON .
  types:
   TT_ZC_PM_PURCHASEORDERITEMMON type standard table of TS_ZC_PM_PURCHASEORDERITEMMON .

  constants GC_C_PURCHASINGGROUPVALUEHELPT type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_PurchasingGroupValueHelpType' ##NO_TEXT.
  constants GC_C_PURCHASINGORGVALUEHELPTYP type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_PurchasingOrgValueHelpType' ##NO_TEXT.
  constants GC_C_PURDOCITEMCATEGORYVALUEHE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_PurDocItemCategoryValueHelpType' ##NO_TEXT.
  constants GC_C_PURDOCITMSTOCKSEGMENTVHTY type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_PurDocItmStockSegmentVHType' ##NO_TEXT.
  constants GC_C_RFQVALUEHELPTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_RFQValueHelpType' ##NO_TEXT.
  constants GC_E_PURCHASINGDOCUMENTITEMTYP type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'E_PurchasingDocumentItemType' ##NO_TEXT.
  constants GC_GOODMOVEMENT type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'GoodMovement' ##NO_TEXT.
  constants GC_I_COMPANYCODESTDVHTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'I_CompanyCodeStdVHType' ##NO_TEXT.
  constants GC_I_CURRENCYTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'I_CurrencyType' ##NO_TEXT.
  constants GC_I_CUSTOMER_VHTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'I_Customer_VHType' ##NO_TEXT.
  constants GC_I_MATERIALSTDVHTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'I_MaterialStdVHType' ##NO_TEXT.
  constants GC_I_PLANTTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'I_PlantType' ##NO_TEXT.
  constants GC_I_PROCMTSUPLRDELIVFORECASTT type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'I_ProcmtSuplrDelivForecastType' ##NO_TEXT.
  constants GC_I_PRODUCTVHTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'I_ProductVHType' ##NO_TEXT.
  constants GC_I_PURCHASINGINFORECORDSTDVH type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'I_PurchasingInfoRecordStdVHType' ##NO_TEXT.
  constants GC_I_SUPPLIER_VHTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'I_Supplier_VHType' ##NO_TEXT.
  constants GC_SERIALNUMBER type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'SerialNumber' ##NO_TEXT.
  constants GC_STORAGELOCATIONSH type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'StorageLocationSH' ##NO_TEXT.
  constants GC_VALUATIONTYPESH type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'ValuationTypeSH' ##NO_TEXT.
  constants GC_ZC_PM_MASSRECEIPTLOGTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'ZC_PM_MassReceiptLogType' ##NO_TEXT.
  constants GC_ZC_PM_PURCHASEORDERITEMMON type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'ZC_PM_PurchaseOrderItemMoniType' ##NO_TEXT.
  constants GC_ZC_PM_PURCHASEORDERITEMMONI type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'ZC_PM_PurchaseOrderItemMoniParameters' ##NO_TEXT.
  constants GC_C_MASSUPDTPURORDVHTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_MassUpdtPurOrdVHType' ##NO_TEXT.
  constants GC_C_MATLDOCOVWCHARVALUEVHTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_MatlDocOvwCharValueVHType' ##NO_TEXT.
  constants GC_C_MM_ACCOUNTASSIGNCATVALUEH type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_MM_AccountAssignCatValueHelpType' ##NO_TEXT.
  constants GC_C_MM_COMPANYCODEVALUEHELPTY type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_MM_CompanyCodeValueHelpType' ##NO_TEXT.
  constants GC_C_MM_MATERIALGROUPVALUEHELP type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_MM_MaterialGroupValueHelpType' ##NO_TEXT.
  constants GC_C_MM_MATERIALVALUEHELPTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_MM_MaterialValueHelpType' ##NO_TEXT.
  constants GC_C_MM_PLANTVALUEHELPTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_MM_PlantValueHelpType' ##NO_TEXT.
  constants GC_C_MM_SERVICEPERFORMERVALUEH type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_MM_ServicePerformerValueHelpType' ##NO_TEXT.
  constants GC_C_MM_SMPLSUPPLIERVALUEHELPT type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_MM_SmplSupplierValueHelpType' ##NO_TEXT.
  constants GC_C_MM_STORLOCVALUEHELPTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_MM_StorLocValueHelpType' ##NO_TEXT.
  constants GC_C_POITEMINTERNALSTATUSVH_2T type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_POItemInternalStatusVH_2Type' ##NO_TEXT.
  constants GC_C_POITEMNEXTDELIVERYSTATUSV type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_POItemNextDeliveryStatusVHType' ##NO_TEXT.
  constants GC_C_POITEMNEXTDELIVERYVALUEHE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_POItemNextDeliveryValueHelpType' ##NO_TEXT.
  constants GC_C_POITEMORDERTYPEVALUEHELPT type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_POItemOrderTypeValueHelpType' ##NO_TEXT.
  constants GC_C_POITEMPRODUCTTYPEVALUEHEL type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_POItemProductTypeValueHelpType' ##NO_TEXT.
  constants GC_C_PRODUCTSEASONYEARVHTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_ProductSeasonYearVHType' ##NO_TEXT.
  constants GC_C_PRODUCTUNITOFMEASUREVHTYP type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_ProductUnitOfMeasureVHType' ##NO_TEXT.
  constants GC_C_PURCHASECONTRACTVALHELPTY type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_PurchaseContractValHelpType' ##NO_TEXT.
  constants GC_C_PURCHASEORDERITEMMONIPARA type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_PurchaseOrderItemMoniParameters' ##NO_TEXT.
  constants GC_C_PURCHASEORDERITEMMONIRESU type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_PurchaseOrderItemMoniResult' ##NO_TEXT.
  constants GC_C_PURCHASEREQUISITIONVALUEH type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_PurchaseRequisitionValueHelpType' ##NO_TEXT.
  constants GC_C_PURCHASINGCATEGORYVALUEHE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'C_PurchasingCategoryValueHelpType' ##NO_TEXT.

  methods LOAD_TEXT_ELEMENTS
  final
    returning
      value(RT_TEXT_ELEMENTS) type TT_TEXT_ELEMENTS
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .

  methods DEFINE
    redefinition .
  methods GET_LAST_MODIFIED
    redefinition .
protected section.
private section.

  constants GC_INCL_NAME type STRING value 'ZCL_ZGW_PM_MASS_RECEIP_MPC====CP' ##NO_TEXT.

  methods DEFINE_SERIALNUMBER
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods DEFINE_GOODMOVEMENT
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods DEFINE_VALUATIONTYPESH
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods DEFINE_STORAGELOCATIONSH
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods DEFINE_ASSOCIATIONS
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods DEFINE_RDS_4
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods GET_LAST_MODIFIED_RDS_4
    returning
      value(RV_LAST_MODIFIED_RDS) type TIMESTAMP .
ENDCLASS.



CLASS ZCL_ZGW_PM_MASS_RECEIP_MPC IMPLEMENTATION.


  method DEFINE.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*

model->set_schema_namespace( 'ZGW_PM_MASS_RECEIPT_SRV' ).

define_serialnumber( ).
define_goodmovement( ).
define_valuationtypesh( ).
define_storagelocationsh( ).
define_associations( ).
define_rds_4( ).
get_last_modified_rds_4( ).
  endmethod.


  method DEFINE_ASSOCIATIONS.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*




data:
lo_annotation     type ref to /iwbep/if_mgw_odata_annotation,                   "#EC NEEDED
lo_entity_type    type ref to /iwbep/if_mgw_odata_entity_typ,                   "#EC NEEDED
lo_association    type ref to /iwbep/if_mgw_odata_assoc,                        "#EC NEEDED
lo_ref_constraint type ref to /iwbep/if_mgw_odata_ref_constr,                   "#EC NEEDED
lo_assoc_set      type ref to /iwbep/if_mgw_odata_assoc_set,                    "#EC NEEDED
lo_nav_property   type ref to /iwbep/if_mgw_odata_nav_prop.                     "#EC NEEDED

***********************************************************************************************************************************
*   ASSOCIATIONS
***********************************************************************************************************************************

 lo_association = model->create_association(
                            iv_association_name = 'GoodMovementToSerialNumber' "#EC NOTEXT
                            iv_left_type        = 'GoodMovement' "#EC NOTEXT
                            iv_right_type       = 'SerialNumber' "#EC NOTEXT
                            iv_right_card       = 'M' "#EC NOTEXT
                            iv_left_card        = '1'  "#EC NOTEXT
                            iv_def_assoc_set    = abap_false ). "#EC NOTEXT
* Referential constraint for association - GoodMovementToSerialNumber
lo_ref_constraint = lo_association->create_ref_constraint( ).
lo_ref_constraint->add_property( iv_principal_property = 'PurchasingDocumentNumber'   iv_dependent_property = 'PurchasingDocumentNumber' ). "#EC NOTEXT
lo_ref_constraint->add_property( iv_principal_property = 'ItemNumber'   iv_dependent_property = 'ItemNumber' ). "#EC NOTEXT
lo_assoc_set = model->create_association_set( iv_association_set_name  = 'GoodMovementToSerialNumberSet'                         "#EC NOTEXT
                                              iv_left_entity_set_name  = 'GoodMovement'              "#EC NOTEXT
                                              iv_right_entity_set_name = 'SerialNumber'             "#EC NOTEXT
                                              iv_association_name      = 'GoodMovementToSerialNumber' ).                                 "#EC NOTEXT


***********************************************************************************************************************************
*   NAVIGATION PROPERTIES
***********************************************************************************************************************************

* Navigation Properties for entity - GoodMovement
lo_entity_type = model->get_entity_type( iv_entity_name = 'GoodMovement' ). "#EC NOTEXT
lo_nav_property = lo_entity_type->create_navigation_property( iv_property_name  = 'serialNumbers' "#EC NOTEXT
                                                              iv_abap_fieldname = '_SERIALNUMBERS' "#EC NOTEXT
                                                              iv_association_name = 'GoodMovementToSerialNumber' ). "#EC NOTEXT
  endmethod.


  method DEFINE_GOODMOVEMENT.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  data:
        lo_annotation     type ref to /iwbep/if_mgw_odata_annotation,                "#EC NEEDED
        lo_entity_type    type ref to /iwbep/if_mgw_odata_entity_typ,                "#EC NEEDED
        lo_complex_type   type ref to /iwbep/if_mgw_odata_cmplx_type,                "#EC NEEDED
        lo_property       type ref to /iwbep/if_mgw_odata_property,                  "#EC NEEDED
        lo_entity_set     type ref to /iwbep/if_mgw_odata_entity_set.                "#EC NEEDED

***********************************************************************************************************************************
*   ENTITY - GoodMovement
***********************************************************************************************************************************

lo_entity_type = model->create_entity_type( iv_entity_type_name = 'GoodMovement' iv_def_entity_set = abap_false ). "#EC NOTEXT

***********************************************************************************************************************************
*Properties
***********************************************************************************************************************************

lo_property = lo_entity_type->create_property( iv_property_name = 'MaterialDocument' iv_abap_fieldname = 'MATERIAL_DOCUMENT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '004' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_is_key( ).
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 10 ). "#EC NOTEXT
lo_property->set_conversion_exit( 'ALPHA' ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_false ).
lo_property->set_filterable( abap_false ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'MaterialDocumentYear' iv_abap_fieldname = 'MATERIAL_DOCUMENT_YEAR' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '005' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_is_key( ).
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_conversion_exit( 'GJAHR' ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_false ).
lo_property->set_filterable( abap_false ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'PurchasingDocumentNumber' iv_abap_fieldname = 'PURCHASING_DOCUMENT_NUMBER' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 10 ). "#EC NOTEXT
lo_property->set_conversion_exit( 'ALPHA' ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_false ).
lo_property->set_filterable( abap_false ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'ItemNumber' iv_abap_fieldname = 'ITEM_NUMBER' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 5 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_false ).
lo_property->set_filterable( abap_false ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'DisplayCurrency' iv_abap_fieldname = 'DISPLAY_CURRENCY' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 5 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_false ).
lo_property->set_filterable( abap_false ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Quantity' iv_abap_fieldname = 'QUANTITY' ). "#EC NOTEXT
lo_property->set_type_edm_decimal( ).
lo_property->set_precison( iv_precision = 3 ). "#EC NOTEXT
lo_property->set_maxlength( iv_max_length = 13 ). "#EC NOTEXT
lo_property->set_creatable( abap_true ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_false ).
lo_property->set_filterable( abap_false ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'ValuationType' iv_abap_fieldname = 'VALUATION_TYPE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '029' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 10 ). "#EC NOTEXT
lo_property->set_creatable( abap_true ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_false ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Plant' iv_abap_fieldname = 'PLANT' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_false ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'StorageLocation' iv_abap_fieldname = 'STORAGE_LOCATION' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_true ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_false ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'BatchNumber' iv_abap_fieldname = 'BATCH_NUMBER' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 10 ). "#EC NOTEXT
lo_property->set_creatable( abap_true ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_false ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'UnitOfMeasure' iv_abap_fieldname = 'UNIT_OF_MEASURE' ). "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 3 ). "#EC NOTEXT
lo_property->set_conversion_exit( 'CUNIT' ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_false ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'PostingDate' iv_abap_fieldname = 'POSTING_DATE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '011' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_datetime( ).
lo_property->set_creatable( abap_true ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_false ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'DocumentDate' iv_abap_fieldname = 'DOCUMENT_DATE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '012' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_datetime( ).
lo_property->set_creatable( abap_true ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_false ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Created' iv_abap_fieldname = 'CREATED' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '015' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_false ).
lo_property->set_filterable( abap_false ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'TestRun' iv_abap_fieldname = 'TEST_RUN' ). "#EC NOTEXT
lo_property->set_type_edm_boolean( ).
lo_property->set_creatable( abap_true ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_false ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'EntityPath' iv_abap_fieldname = '_ENTITY_PATH' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '014' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_creatable( abap_true ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_true ).
lo_property->set_filterable( abap_false ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).

lo_entity_type->bind_structure( iv_structure_name   = 'ZSPM_MASS_RCPT_MOVEMENT_ODATA'
                                iv_bind_conversions = 'X' ). "#EC NOTEXT


***********************************************************************************************************************************
*   ENTITY SETS
***********************************************************************************************************************************
lo_entity_set = lo_entity_type->create_entity_set( 'GoodMovement' ). "#EC NOTEXT

lo_entity_set->set_creatable( abap_true ).
lo_entity_set->set_updatable( abap_false ).
lo_entity_set->set_deletable( abap_false ).

lo_entity_set->set_pageable( abap_false ).
lo_entity_set->set_addressable( abap_false ).
lo_entity_set->set_has_ftxt_search( abap_false ).
lo_entity_set->set_subscribable( abap_false ).
lo_entity_set->set_filter_required( abap_false ).
  endmethod.


  method DEFINE_RDS_4.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*
*   This code is generated for Reference Data Source
*   4
*&---------------------------------------------------------------------*
    TRY.
        if_sadl_gw_model_exposure_data~get_model_exposure( )->expose( model )->expose_vocabulary( vocab_anno_model ).
      CATCH cx_sadl_exposure_error INTO DATA(lx_sadl_exposure_error).
        RAISE EXCEPTION TYPE /iwbep/cx_mgw_med_exception
          EXPORTING
            previous = lx_sadl_exposure_error.
    ENDTRY.
  endmethod.


  method DEFINE_SERIALNUMBER.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  data:
        lo_annotation     type ref to /iwbep/if_mgw_odata_annotation,                "#EC NEEDED
        lo_entity_type    type ref to /iwbep/if_mgw_odata_entity_typ,                "#EC NEEDED
        lo_complex_type   type ref to /iwbep/if_mgw_odata_cmplx_type,                "#EC NEEDED
        lo_property       type ref to /iwbep/if_mgw_odata_property,                  "#EC NEEDED
        lo_entity_set     type ref to /iwbep/if_mgw_odata_entity_set.                "#EC NEEDED

***********************************************************************************************************************************
*   ENTITY - SerialNumber
***********************************************************************************************************************************

lo_entity_type = model->create_entity_type( iv_entity_type_name = 'SerialNumber' iv_def_entity_set = abap_false ). "#EC NOTEXT

***********************************************************************************************************************************
*Properties
***********************************************************************************************************************************

lo_property = lo_entity_type->create_property( iv_property_name = 'PurchasingDocumentNumber' iv_abap_fieldname = 'PURCHASING_DOCUMENT_NUMBER' ). "#EC NOTEXT
lo_property->set_is_key( ).
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 10 ). "#EC NOTEXT
lo_property->set_conversion_exit( 'ALPHA' ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_false ).
lo_property->set_filterable( abap_false ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'ItemNumber' iv_abap_fieldname = 'ITEM_NUMBER' ). "#EC NOTEXT
lo_property->set_is_key( ).
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 5 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_false ).
lo_property->set_filterable( abap_false ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'Number' iv_abap_fieldname = 'SERIAL_NUMBER' ). "#EC NOTEXT
lo_property->set_is_key( ).
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 8 ). "#EC NOTEXT
lo_property->set_creatable( abap_true ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_false ).
lo_property->set_nullable( abap_false ).
lo_property->set_filterable( abap_false ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).

lo_entity_type->bind_structure( iv_structure_name   = 'ZSPM_MASS_RCPT_SER_NUM_ODATA'
                                iv_bind_conversions = 'X' ). "#EC NOTEXT


***********************************************************************************************************************************
*   ENTITY SETS
***********************************************************************************************************************************
lo_entity_set = lo_entity_type->create_entity_set( 'SerialNumber' ). "#EC NOTEXT

lo_entity_set->set_creatable( abap_true ).
lo_entity_set->set_updatable( abap_false ).
lo_entity_set->set_deletable( abap_false ).

lo_entity_set->set_pageable( abap_false ).
lo_entity_set->set_addressable( abap_false ).
lo_entity_set->set_has_ftxt_search( abap_false ).
lo_entity_set->set_subscribable( abap_false ).
lo_entity_set->set_filter_required( abap_false ).
  endmethod.


  method DEFINE_STORAGELOCATIONSH.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  data:
        lo_annotation     type ref to /iwbep/if_mgw_odata_annotation,                "#EC NEEDED
        lo_entity_type    type ref to /iwbep/if_mgw_odata_entity_typ,                "#EC NEEDED
        lo_complex_type   type ref to /iwbep/if_mgw_odata_cmplx_type,                "#EC NEEDED
        lo_property       type ref to /iwbep/if_mgw_odata_property,                  "#EC NEEDED
        lo_entity_set     type ref to /iwbep/if_mgw_odata_entity_set.                "#EC NEEDED

***********************************************************************************************************************************
*   ENTITY - StorageLocationSH
***********************************************************************************************************************************

lo_entity_type = model->create_entity_type( iv_entity_type_name = 'StorageLocationSH' iv_def_entity_set = abap_false ). "#EC NOTEXT

***********************************************************************************************************************************
*Properties
***********************************************************************************************************************************

lo_property = lo_entity_type->create_property( iv_property_name = 'Plant' iv_abap_fieldname = 'WERKS' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '017' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_is_key( ).
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_false ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'StorageLocation' iv_abap_fieldname = 'LGORT' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '018' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_is_key( ).
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 4 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_false ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).
lo_property = lo_entity_type->create_property( iv_property_name = 'StorageLocationName' iv_abap_fieldname = 'LGOBE' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '019' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 16 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_false ).
lo_property->set_filterable( abap_false ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).

lo_entity_type->bind_structure( iv_structure_name  = 'ZCL_ZGW_PM_MASS_RECEIP_MPC=>TS_STORAGELOCATIONSH' ). "#EC NOTEXT


***********************************************************************************************************************************
*   ENTITY SETS
***********************************************************************************************************************************
lo_entity_set = lo_entity_type->create_entity_set( 'StorageLocationSH' ). "#EC NOTEXT

lo_entity_set->set_creatable( abap_false ).
lo_entity_set->set_updatable( abap_false ).
lo_entity_set->set_deletable( abap_false ).

lo_entity_set->set_pageable( abap_false ).
lo_entity_set->set_addressable( abap_true ).
lo_entity_set->set_has_ftxt_search( abap_false ).
lo_entity_set->set_subscribable( abap_false ).
lo_entity_set->set_filter_required( abap_false ).
  endmethod.


  method DEFINE_VALUATIONTYPESH.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  data:
        lo_annotation     type ref to /iwbep/if_mgw_odata_annotation,                "#EC NEEDED
        lo_entity_type    type ref to /iwbep/if_mgw_odata_entity_typ,                "#EC NEEDED
        lo_complex_type   type ref to /iwbep/if_mgw_odata_cmplx_type,                "#EC NEEDED
        lo_property       type ref to /iwbep/if_mgw_odata_property,                  "#EC NEEDED
        lo_entity_set     type ref to /iwbep/if_mgw_odata_entity_set.                "#EC NEEDED

***********************************************************************************************************************************
*   ENTITY - ValuationTypeSH
***********************************************************************************************************************************

lo_entity_type = model->create_entity_type( iv_entity_type_name = 'ValuationTypeSH' iv_def_entity_set = abap_false ). "#EC NOTEXT

***********************************************************************************************************************************
*Properties
***********************************************************************************************************************************

lo_property = lo_entity_type->create_property( iv_property_name = 'ValuationType' iv_abap_fieldname = 'BWTAR' ). "#EC NOTEXT
lo_property->set_label_from_text_element( iv_text_element_symbol = '013' iv_text_element_container = gc_incl_name ).  "#EC NOTEXT
lo_property->set_is_key( ).
lo_property->set_type_edm_string( ).
lo_property->set_maxlength( iv_max_length = 10 ). "#EC NOTEXT
lo_property->set_creatable( abap_false ).
lo_property->set_updatable( abap_false ).
lo_property->set_sortable( abap_true ).
lo_property->set_nullable( abap_false ).
lo_property->set_filterable( abap_true ).
lo_property->/iwbep/if_mgw_odata_annotatabl~create_annotation( 'sap' )->add(
      EXPORTING
        iv_key      = 'unicode'
        iv_value    = 'false' ).

lo_entity_type->bind_structure( iv_structure_name  = 'ZCL_ZGW_PM_MASS_RECEIP_MPC=>TS_VALUATIONTYPESH' ). "#EC NOTEXT


***********************************************************************************************************************************
*   ENTITY SETS
***********************************************************************************************************************************
lo_entity_set = lo_entity_type->create_entity_set( 'ValuationTypeSH' ). "#EC NOTEXT

lo_entity_set->set_creatable( abap_false ).
lo_entity_set->set_updatable( abap_false ).
lo_entity_set->set_deletable( abap_false ).

lo_entity_set->set_pageable( abap_false ).
lo_entity_set->set_addressable( abap_true ).
lo_entity_set->set_has_ftxt_search( abap_false ).
lo_entity_set->set_subscribable( abap_false ).
lo_entity_set->set_filter_required( abap_false ).
  endmethod.


  method GET_LAST_MODIFIED.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  CONSTANTS: lc_gen_date_time TYPE timestamp VALUE '20240329114831'.                  "#EC NOTEXT
 DATA: lv_rds_last_modified TYPE timestamp .
  rv_last_modified = super->get_last_modified( ).
  IF rv_last_modified LT lc_gen_date_time.
    rv_last_modified = lc_gen_date_time.
  ENDIF.
 lv_rds_last_modified =  GET_LAST_MODIFIED_RDS_4( ).
 IF rv_last_modified LT lv_rds_last_modified.
 rv_last_modified  = lv_rds_last_modified .
 ENDIF .
  endmethod.


  method GET_LAST_MODIFIED_RDS_4.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*
*   This code is generated for Reference Data Source
*   4
*&---------------------------------------------------------------------*
*    @@TYPE_SWITCH:
    CONSTANTS: co_gen_date_time TYPE timestamp VALUE '20240329114832'.
    TRY.
        rv_last_modified_rds = CAST cl_sadl_gw_model_exposure( if_sadl_gw_model_exposure_data~get_model_exposure( ) )->get_last_modified( ).
      CATCH cx_root ##CATCH_ALL.
        rv_last_modified_rds = co_gen_date_time.
    ENDTRY.
    IF rv_last_modified_rds < co_gen_date_time.
      rv_last_modified_rds = co_gen_date_time.
    ENDIF.
  endmethod.


  method IF_SADL_GW_MODEL_EXPOSURE_DATA~GET_MODEL_EXPOSURE.
    CONSTANTS: co_gen_timestamp TYPE timestamp VALUE '20240329114832'.
    DATA(lv_sadl_xml) =
               |<?xml version="1.0" encoding="utf-16"?>|  &
               |<sadl:definition xmlns:sadl="http://sap.com/sap.nw.f.sadl" syntaxVersion="V2" >|  &
               | <sadl:dataSource type="CDS" name="C_MASSUPDTPURORDVH" binding="C_MASSUPDTPURORDVH" />|  &
               | <sadl:dataSource type="CDS" name="C_PURCHASINGORGVALUEHELP" binding="C_PURCHASINGORGVALUEHELP" />|  &
               | <sadl:dataSource type="CDS" name="C_PURDOCITEMCATEGORYVALUEHELP" binding="C_PURDOCITEMCATEGORYVALUEHELP" />|  &
               | <sadl:dataSource type="CDS" name="C_POITEMORDERTYPEVALUEHELP" binding="C_POITEMORDERTYPEVALUEHELP" />|  &
               | <sadl:dataSource type="CDS" name="C_PURDOCITMSTOCKSEGMENTVH" binding="C_PURDOCITMSTOCKSEGMENTVH" />|  &
               | <sadl:dataSource type="CDS" name="C_MM_ACCOUNTASSIGNCATVALUEHELP" binding="C_MM_ACCOUNTASSIGNCATVALUEHELP" />|  &
               | <sadl:dataSource type="CDS" name="C_RFQVALUEHELP" binding="C_RFQVALUEHELP" />|  &
               | <sadl:dataSource type="CDS" name="C_PRODUCTUNITOFMEASUREVH" binding="C_PRODUCTUNITOFMEASUREVH" />|  &
               | <sadl:dataSource type="CDS" name="E_PURCHASINGDOCUMENTITEM" binding="E_PURCHASINGDOCUMENTITEM" />|  &
               | <sadl:dataSource type="CDS" name="C_MM_PLANTVALUEHELP" binding="C_MM_PLANTVALUEHELP" />|  &
               | <sadl:dataSource type="CDS" name="I_COMPANYCODESTDVH" binding="I_COMPANYCODESTDVH" />|  &
               | <sadl:dataSource type="CDS" name="C_PURCHASEREQUISITIONVALUEHELP" binding="C_PURCHASEREQUISITIONVALUEHELP" />|  &
               | <sadl:dataSource type="CDS" name="I_CURRENCY" binding="I_CURRENCY" />|  &
               | <sadl:dataSource type="CDS" name="C_POITEMINTERNALSTATUSVH_2" binding="C_POITEMINTERNALSTATUSVH_2" />|  &
               | <sadl:dataSource type="CDS" name="I_CUSTOMER_VH" binding="I_CUSTOMER_VH" />|  &
               | <sadl:dataSource type="CDS" name="I_MATERIALSTDVH" binding="I_MATERIALSTDVH" />|  &
               | <sadl:dataSource type="CDS" name="C_POITEMPRODUCTTYPEVALUEHELP" binding="C_POITEMPRODUCTTYPEVALUEHELP" />|  &
               | <sadl:dataSource type="CDS" name="I_PLANT" binding="I_PLANT" />|  &
               | <sadl:dataSource type="CDS" name="I_PROCMTSUPLRDELIVFORECAST" binding="I_PROCMTSUPLRDELIVFORECAST" />|  &
               | <sadl:dataSource type="CDS" name="C_PURCHASECONTRACTVALHELP" binding="C_PURCHASECONTRACTVALHELP" />|  &
               | <sadl:dataSource type="CDS" name="I_PRODUCTVH" binding="I_PRODUCTVH" />|  &
               | <sadl:dataSource type="CDS" name="I_PURCHASINGINFORECORDSTDVH" binding="I_PURCHASINGINFORECORDSTDVH" />|  &
               | <sadl:dataSource type="CDS" name="C_PURCHASINGCATEGORYVALUEHELP" binding="C_PURCHASINGCATEGORYVALUEHELP" />|  &
               | <sadl:dataSource type="CDS" name="C_MM_COMPANYCODEVALUEHELP" binding="C_MM_COMPANYCODEVALUEHELP" />|  &
               | <sadl:dataSource type="CDS" name="I_SUPPLIER_VH" binding="I_SUPPLIER_VH" />|  &
               | <sadl:dataSource type="CDS" name="C_MM_SERVICEPERFORMERVALUEHELP" binding="C_MM_SERVICEPERFORMERVALUEHELP" />|  &
               | <sadl:dataSource type="CDS" name="ZC_PM_MASSRECEIPTLOG" binding="ZC_PM_MASSRECEIPTLOG" />|  &
               | <sadl:dataSource type="CDS" name="C_POITEMNEXTDELIVERYSTATUSVH" binding="C_POITEMNEXTDELIVERYSTATUSVH" />|  &
               | <sadl:dataSource type="CDS" name="ZC_PM_PURCHASEORDERITEMMONI" binding="ZC_PM_PURCHASEORDERITEMMONI" />|  &
               | <sadl:dataSource type="CDS" name="C_MATLDOCOVWCHARVALUEVH" binding="C_MATLDOCOVWCHARVALUEVH" />|  &
               | <sadl:dataSource type="CDS" name="C_MM_MATERIALGROUPVALUEHELP" binding="C_MM_MATERIALGROUPVALUEHELP" />|  &
               | <sadl:dataSource type="CDS" name="C_MM_MATERIALVALUEHELP" binding="C_MM_MATERIALVALUEHELP" />|  &
               | <sadl:dataSource type="CDS" name="C_MM_SMPLSUPPLIERVALUEHELP" binding="C_MM_SMPLSUPPLIERVALUEHELP" />|  &
               | <sadl:dataSource type="CDS" name="C_MM_STORLOCVALUEHELP" binding="C_MM_STORLOCVALUEHELP" />|  &
               | <sadl:dataSource type="CDS" name="C_POITEMNEXTDELIVERYVALUEHELP" binding="C_POITEMNEXTDELIVERYVALUEHELP" />|  &
               | <sadl:dataSource type="CDS" name="C_PRODUCTSEASONYEARVH" binding="C_PRODUCTSEASONYEARVH" />|  &
               | <sadl:dataSource type="CDS" name="C_PURCHASEORDERITEMMONI" binding="C_PURCHASEORDERITEMMONI" />|  &
               | <sadl:dataSource type="CDS" name="C_PURCHASINGGROUPVALUEHELP" binding="C_PURCHASINGGROUPVALUEHELP" />|  &
               |<sadl:resultSet>|  &
               |<sadl:structure name="C_MassUpdtPurOrdVH" dataSource="C_MASSUPDTPURORDVH" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="C_PurchasingOrgValueHelp" dataSource="C_PURCHASINGORGVALUEHELP" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="C_PurDocItemCategoryValueHelp" dataSource="C_PURDOCITEMCATEGORYVALUEHELP" maxEditMode="RO" exposure="TRUE" >| .
      lv_sadl_xml = |{ lv_sadl_xml }| &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="C_POItemOrderTypeValueHelp" dataSource="C_POITEMORDERTYPEVALUEHELP" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="C_PurDocItmStockSegmentVH" dataSource="C_PURDOCITMSTOCKSEGMENTVH" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="C_MM_AccountAssignCatValueHelp" dataSource="C_MM_ACCOUNTASSIGNCATVALUEHELP" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="C_RFQValueHelp" dataSource="C_RFQVALUEHELP" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="C_ProductUnitOfMeasureVH" dataSource="C_PRODUCTUNITOFMEASUREVH" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="E_PurchasingDocumentItem" dataSource="E_PURCHASINGDOCUMENTITEM" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="C_MM_PlantValueHelp" dataSource="C_MM_PLANTVALUEHELP" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="I_CompanyCodeStdVH" dataSource="I_COMPANYCODESTDVH" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="C_PurchaseRequisitionValueHelp" dataSource="C_PURCHASEREQUISITIONVALUEHELP" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="I_Currency" dataSource="I_CURRENCY" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="C_POItemInternalStatusVH_2" dataSource="C_POITEMINTERNALSTATUSVH_2" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="I_Customer_VH" dataSource="I_CUSTOMER_VH" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>| .
      lv_sadl_xml = |{ lv_sadl_xml }| &
               |</sadl:structure>|  &
               |<sadl:structure name="I_MaterialStdVH" dataSource="I_MATERIALSTDVH" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="C_POItemProductTypeValueHelp" dataSource="C_POITEMPRODUCTTYPEVALUEHELP" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="I_Plant" dataSource="I_PLANT" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="I_ProcmtSuplrDelivForecast" dataSource="I_PROCMTSUPLRDELIVFORECAST" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="C_PurchaseContractValHelp" dataSource="C_PURCHASECONTRACTVALHELP" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="I_ProductVH" dataSource="I_PRODUCTVH" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="I_PurchasingInfoRecordStdVH" dataSource="I_PURCHASINGINFORECORDSTDVH" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="C_PurchasingCategoryValueHelp" dataSource="C_PURCHASINGCATEGORYVALUEHELP" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="C_MM_CompanyCodeValueHelp" dataSource="C_MM_COMPANYCODEVALUEHELP" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="I_Supplier_VH" dataSource="I_SUPPLIER_VH" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="C_MM_ServicePerformerValueHelp" dataSource="C_MM_SERVICEPERFORMERVALUEHELP" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="ZC_PM_MassReceiptLog" dataSource="ZC_PM_MASSRECEIPTLOG" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="C_POItemNextDeliveryStatusVH" dataSource="C_POITEMNEXTDELIVERYSTATUSVH" maxEditMode="RO" exposure="TRUE" >| .
      lv_sadl_xml = |{ lv_sadl_xml }| &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="ZC_PM_PurchaseOrderItemMoniSet" dataSource="ZC_PM_PURCHASEORDERITEMMONI" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="C_MatlDocOvwCharValueVH" dataSource="C_MATLDOCOVWCHARVALUEVH" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="C_MM_MaterialGroupValueHelp" dataSource="C_MM_MATERIALGROUPVALUEHELP" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="C_MM_MaterialValueHelp" dataSource="C_MM_MATERIALVALUEHELP" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="C_MM_SmplSupplierValueHelp" dataSource="C_MM_SMPLSUPPLIERVALUEHELP" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="C_MM_StorLocValueHelp" dataSource="C_MM_STORLOCVALUEHELP" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="C_POItemNextDeliveryValueHelp" dataSource="C_POITEMNEXTDELIVERYVALUEHELP" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="C_ProductSeasonYearVH" dataSource="C_PRODUCTSEASONYEARVH" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="C_PurchaseOrderItemMoniResults" dataSource="C_PURCHASEORDERITEMMONI" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="C_PurchasingGroupValueHelp" dataSource="C_PURCHASINGGROUPVALUEHELP" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |</sadl:resultSet>|  &
               |</sadl:definition>| .

   ro_model_exposure = cl_sadl_gw_model_exposure=>get_exposure_xml( iv_uuid      = CONV #( 'ZGW_PM_MASS_RECEIPT' )
                                                                    iv_timestamp = co_gen_timestamp
                                                                    iv_sadl_xml  = lv_sadl_xml ).
  endmethod.


  method LOAD_TEXT_ELEMENTS.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*


DATA:
     ls_text_element TYPE ts_text_element.                                 "#EC NEEDED


clear ls_text_element.
ls_text_element-artifact_name          = 'MaterialDocument'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'GoodMovement'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '004'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'MaterialDocumentYear'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'GoodMovement'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '005'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'ValuationType'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'GoodMovement'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '029'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'PostingDate'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'GoodMovement'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '011'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'DocumentDate'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'GoodMovement'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '012'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'Created'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'GoodMovement'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '015'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'EntityPath'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'GoodMovement'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '014'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.


clear ls_text_element.
ls_text_element-artifact_name          = 'ValuationType'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'ValuationTypeSH'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '013'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.


clear ls_text_element.
ls_text_element-artifact_name          = 'Plant'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'StorageLocationSH'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '017'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'StorageLocation'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'StorageLocationSH'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '018'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
clear ls_text_element.
ls_text_element-artifact_name          = 'StorageLocationName'.                 "#EC NOTEXT
ls_text_element-artifact_type          = 'PROP'.                                       "#EC NOTEXT
ls_text_element-parent_artifact_name   = 'StorageLocationSH'.                            "#EC NOTEXT
ls_text_element-parent_artifact_type   = 'ETYP'.                                       "#EC NOTEXT
ls_text_element-text_symbol            = '019'.              "#EC NOTEXT
APPEND ls_text_element TO rt_text_elements.
  endmethod.
ENDCLASS.
