@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Mass goods receipt: Logs'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_PM_MassReceiptLog as select from zta_mass_rcp_log
{
  key log_id                as LogId,
  purchase_order        	as PurchaseOrder,
  purchase_order_item   	as PurchaseOrderItem,
  display_currency      	as DisplayCurrency,  
  @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
  quantity                  as Quantity,  
  unit_of_measure           as UnitOfMeasure,
  valuation_type            as ValuationType,	
  batch_number              as BatchNumber,
  posting_date         	 	as PostingDate,
  document_date             as DocumentDate,
  material_document         as MaterialDocument,
  material_document_year    as MaterialDocumentYear,
  creation_date             as CreationDate,
  creation_user             as CreationUser
}
