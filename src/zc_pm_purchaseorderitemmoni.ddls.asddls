@AbapCatalog.sqlViewName: 'ZCPURORDITEMMONI'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Monitor Purchase Order Items (modified)'

define view ZC_PM_PurchaseOrderItemMoni 
  with parameters
    @Consumption.valueHelpDefinition: [{ entity: { name : 'I_Currency', element : 'Currency' } }]
    P_DisplayCurrency : vdm_v_display_currency
as select from C_PurchaseOrderItemMoni(P_DisplayCurrency: $parameters.P_DisplayCurrency)

    inner join ekpo as ekpo on ekpo.ebeln = C_PurchaseOrderItemMoni.PurchaseOrder and 
                               ekpo.ebelp = C_PurchaseOrderItemMoni.PurchaseOrderItem
                               
    inner join eket as eket on eket.ebeln = C_PurchaseOrderItemMoni.PurchaseOrder and 
                               eket.ebelp = C_PurchaseOrderItemMoni.PurchaseOrderItem and
                               eket.etenr = '0001'
                               
    left outer join marc as marc on marc.matnr = C_PurchaseOrderItemMoni.Material and 
                                    marc.werks = C_PurchaseOrderItemMoni.Plant
                                    
    left outer join t001w as t001w on t001w.werks = C_PurchaseOrderItemMoni.Plant
                                        
    left outer join mbew as mbew on mbew.matnr = C_PurchaseOrderItemMoni.Material and 
                                    mbew.bwkey = t001w.bwkey and 
                                    mbew.bwtar = ekpo.bwtar
{
    key C_PurchaseOrderItemMoni.PurchaseOrder,
    key C_PurchaseOrderItemMoni.PurchaseOrderItem,
    C_PurchaseOrderItemMoni.PurgDocMigrtnIsCmpltdForAnlyts,
    C_PurchaseOrderItemMoni.FormattedPurchaseOrderItem,
    C_PurchaseOrderItemMoni.PurchaseOrderType,
    C_PurchaseOrderItemMoni.PurchaseOrderTypeName,
    C_PurchaseOrderItemMoni.Supplier,
    C_PurchaseOrderItemMoni.SupplierName,
    C_PurchaseOrderItemMoni.SupplyingPlant,
    C_PurchaseOrderItemMoni.SupplyingPlantName,
    C_PurchaseOrderItemMoni.PurchasingOrganization,
    C_PurchaseOrderItemMoni.PurchasingOrganizationName,
    C_PurchaseOrderItemMoni.CompanyCode,
    C_PurchaseOrderItemMoni.CompanyCodeName,
    C_PurchaseOrderItemMoni.PurchasingGroup,
    C_PurchaseOrderItemMoni.PurchasingGroupName,
    C_PurchaseOrderItemMoni.DocumentCurrency,
    C_PurchaseOrderItemMoni.CurrencyName,
    C_PurchaseOrderItemMoni.PurchaseOrderDate,
    C_PurchaseOrderItemMoni.CreatedByUser,
    C_PurchaseOrderItemMoni.CreatedByUserFullName,
    C_PurchaseOrderItemMoni.CreationDate,
    C_PurchaseOrderItemMoni.PurchaseContract,
    C_PurchaseOrderItemMoni.PurchaseContractItem,
    C_PurchaseOrderItemMoni.NumberOfPurchaseOrderItems,
    C_PurchaseOrderItemMoni.PurchaseOrderItemText,
    C_PurchaseOrderItemMoni.MaterialGroup,
    C_PurchaseOrderItemMoni.MaterialGroupName,
    C_PurchaseOrderItemMoni.Material,
    C_PurchaseOrderItemMoni.MaterialName,
    C_PurchaseOrderItemMoni.ProductType,
    C_PurchaseOrderItemMoni.ProductTypeName,
    C_PurchaseOrderItemMoni.PurchaseOrderItemCategory,
    C_PurchaseOrderItemMoni.PurgDocExternalItemCategory,
    C_PurchaseOrderItemMoni.PurOrdItemCategoryName,
    C_PurchaseOrderItemMoni.AccountAssignmentCategory,
    C_PurchaseOrderItemMoni.AcctAssignmentCategoryName,
    C_PurchaseOrderItemMoni.Plant,
    C_PurchaseOrderItemMoni.PlantName,
    C_PurchaseOrderItemMoni.ServicePerformer,
    C_PurchaseOrderItemMoni.ServicePerformerName,
    C_PurchaseOrderItemMoni.PurchasingCategory,
    C_PurchaseOrderItemMoni.PurgCatName,
    C_PurchaseOrderItemMoni.IsReturnsItem,
    C_PurchaseOrderItemMoni.DeliveryDateCriticality,
    C_PurchaseOrderItemMoni.ScheduleLineDeliveryDate,
    C_PurchaseOrderItemMoni.ScheduleLineOpenQty,
    C_PurchaseOrderItemMoni.DeliveryStatus,
    C_PurchaseOrderItemMoni.DeliveryStatusDescription,
    C_PurchaseOrderItemMoni.InbDelivDateCriticality,
    C_PurchaseOrderItemMoni.OrdAcknDateCriticality,
    C_PurchaseOrderItemMoni.NextInbDeliveryDate,
    C_PurchaseOrderItemMoni.NextInbDeliveryQuantity,
    C_PurchaseOrderItemMoni.NextAcknDeliveryDate,
    C_PurchaseOrderItemMoni.NextAcknDeliveryQuantity,
    C_PurchaseOrderItemMoni.PerformancePeriodStartDate,
    C_PurchaseOrderItemMoni.PerformancePeriodEndDate,
    C_PurchaseOrderItemMoni.OrderQuantity,
    C_PurchaseOrderItemMoni.NetPriceAmount,
    C_PurchaseOrderItemMoni.OrderPriceUnit,
    C_PurchaseOrderItemMoni.NetAmount,
    C_PurchaseOrderItemMoni.ExpectedOverallLimitAmount,
    C_PurchaseOrderItemMoni.OverallLimitAmount,
    C_PurchaseOrderItemMoni.GoodsReceiptQty,
    C_PurchaseOrderItemMoni.GoodsReceiptAmountInCoCodeCrcy,
    
    @Consumption.filter.hidden: true
    C_PurchaseOrderItemMoni.StillToBeDeliveredQuantity,
    
    C_PurchaseOrderItemMoni.StillToBeDeliveredValue,
    C_PurchaseOrderItemMoni.InvoiceReceiptQty,
    C_PurchaseOrderItemMoni.InvoiceReceiptAmount,
    C_PurchaseOrderItemMoni.StillToInvoiceQuantity,
    C_PurchaseOrderItemMoni.StillToInvoiceValue,
    C_PurchaseOrderItemMoni.NetPriceQuantity,
    C_PurchaseOrderItemMoni.PurchaseOrderQuantityUnit,
    C_PurchaseOrderItemMoni.UnitOfMeasureLongName,
    C_PurchaseOrderItemMoni.DisplayCurrency,
    C_PurchaseOrderItemMoni.GoodsReceiptIsExpected,
    C_PurchaseOrderItemMoni.GoodsReceiptIsNonValuated,
    
    @Consumption.filter.hidden: true
    C_PurchaseOrderItemMoni.IsCompletelyDelivered,
    
    C_PurchaseOrderItemMoni.IsFinallyInvoiced,
    C_PurchaseOrderItemMoni.InvoiceIsExpected,
    C_PurchaseOrderItemMoni.InvoiceIsGoodsReceiptBased,
    C_PurchaseOrderItemMoni.IsCompleted,
    C_PurchaseOrderItemMoni.StorageLocation,
    C_PurchaseOrderItemMoni.StorageLocationName,
    C_PurchaseOrderItemMoni.RequirementTracking,
    C_PurchaseOrderItemMoni.PurchaseRequisition,
    C_PurchaseOrderItemMoni.PurchaseRequisitionItem,
    C_PurchaseOrderItemMoni.PlannedDeliveryDuration,
    C_PurchaseOrderItemMoni.RequestForQuotation,
    C_PurchaseOrderItemMoni.RequestForQuotationItem,
    C_PurchaseOrderItemMoni.SupplierQuotation,
    C_PurchaseOrderItemMoni.SupplierQuotationItem,
    C_PurchaseOrderItemMoni.PredictedDaysOfDelivDeviation,
    C_PurchaseOrderItemMoni.PredictedDelivDte,
    C_PurchaseOrderItemMoni.PurchaseOrderScheduleLine,
    C_PurchaseOrderItemMoni.PredictedDelDaysRltnPOPostDate,
    C_PurchaseOrderItemMoni.DeliveryInfoText2,
    C_PurchaseOrderItemMoni.SuplrNextDeliveryPredictionDte,
    C_PurchaseOrderItemMoni.PurchasingInfoRecord,
    C_PurchaseOrderItemMoni.InfoRecordIsToBeUpdated,
    C_PurchaseOrderItemMoni.PurchasingIsBlocked,
    C_PurchaseOrderItemMoni.PurchaseOrderStatus,
    C_PurchaseOrderItemMoni.PurchaseOrderOutputStatusName,
    
    @Consumption.filter.hidden: true
    C_PurchaseOrderItemMoni.PurchaseOrderItemStatus,
    @Consumption.filter.hidden: true    
    C_PurchaseOrderItemMoni.PurchaseOrderItemStatusName,
    
    C_PurchaseOrderItemMoni.ProductSeasonYear,
    C_PurchaseOrderItemMoni.ProductSeason,
    C_PurchaseOrderItemMoni.ProductCollection,
    C_PurchaseOrderItemMoni.ProductTheme,
    C_PurchaseOrderItemMoni.CrossPlantConfigurableProduct,
    C_PurchaseOrderItemMoni.ProductCharacteristic1,
    C_PurchaseOrderItemMoni.ProductCharacteristic2,
    C_PurchaseOrderItemMoni.ProductCharacteristic3,
    C_PurchaseOrderItemMoni.StockSegment,
    
    //Additional fields used for the mass goods receipt UI5 app       
    ekpo.bwtar as ValuationType,    
    marc.bwtty as ValuationCategory,
    
    @EndUserText: {label: 'Value Type required', quickInfo: 'Value Type is required'}
    @Consumption.filter.hidden: true    
    @UI.hidden: true
    cast ( case when marc.bwtty = 'X' then 'X' else '' end as boole_d preserving type ) as ValuationTypeRequired, 
          
    eket.charg as Batch,        
    eket.wemng as GoodsReceiptQuantity, 
    
    @Consumption.filter.hidden: true
    @UI.hidden: true
    cast( (coalesce(eket.menge, 0) - coalesce(eket.wemng, 0)) as abap.dec(13, 3) ) as DefaultQuantity,
           
    marc.xchpf as BatchManagement,    
    marc.sernp as SerialNumberProfile,
    
    @EndUserText: {label: 'Serial numbers required', quickInfo: 'Serial numbers are required'}
    @Consumption.filter.hidden: true
    @UI.hidden: true
    cast ( case when marc.sernp is not initial then 'X' else '' end as boole_d preserving type ) as SerialNumberRequired
           
}
where C_PurchaseOrderItemMoni.StillToBeDeliveredQuantity > 0 
  and C_PurchaseOrderItemMoni.IsCompletelyDelivered = '' 
  and C_PurchaseOrderItemMoni.PurchaseOrderItemStatus <> '02' //Exclude under approval
