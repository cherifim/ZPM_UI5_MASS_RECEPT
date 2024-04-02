sap.ui.define(["com/toray/massreceipt/controller/BaseController","sap/ui/core/Fragment","sap/m/Token","sap/m/MessageBox","sap/ui/model/odata/v2/ODataListBinding"],function(e,t,o,n,r){"use strict";return e.extend("com.toray.massreceipt.controller.Movement+
",{onInit:function(){e.prototype.onInit.call(this);this.getRouter().getRoute("RouteMovement").attachMatched(this._onRouteSelectOrder,this)},_onRouteSelectOrder:async function(e){if(this.getOwnerComponent().getSelectionChanged()===true){this.removeAllMess+
ages();this.generateMovmentTableItems();this.getOwnerComponent().setSelectionChanged(false)}},generateMovmentTableItems:async function(){const e=this.byId("MovementsTable");e.destroyItems();this.getModel().resetChanges(null,true,true);const n=this.getOwn+
erComponent().getSelectedItemsContexts();if(n==null||n?.length==0){this.getRouter().navTo("RouteItemsList",null,null,true);return}this.setModel(this.getModel(),"POItem");const r=await t.load({name:"com.toray.massreceipt.view.fragments.GoodReceiptColumnLi+
stItem",controller:this});this.getView().addDependent(r);n.forEach(async t=>{let n=this.getModel().createEntry("/GoodMovement",{properties:{PurchasingDocumentNumber:t.getProperty("PurchaseOrder"),ItemNumber:t.getProperty("PurchaseOrderItem"),DisplayCurre+
ncy:t.getProperty("DisplayCurrency")}});this.getModel().setProperty("EntityPath",n.getPath(),n);const s={Quantity:t.getProperty("DefaultQuantity"),UnitOfMeasure:t.getProperty("PurchaseOrderQuantityUnit"),PostingDate:new Date,DocumentDate:new Date,Plant:t+
.getProperty("Plant"),StorageLocation:t.getProperty("StorageLocation"),BatchNumber:t.getProperty("Batch"),ValuationType:t.getProperty("ValuationType"),Created:false};Object.entries(s).forEach(([e,t])=>{this.getModel().setProperty(e,t,n)});const a=r.clone+
();e.addItem(a);a.bindElement(n.getPath());a.setBindingContext(t,"POItem");const i=a.getCells().find(e=>e.getMetadata().getName()==="sap.m.MultiInput");i.addValidator(e=>new o({key:e.text,text:e.text}))})},onPerformGoodReceipt:function(e){this.executeGoo+
dReceipt()},executeGoodReceipt:function(){n.confirm(this.getResourceText("msg.goodreceipt.confirm",null),{actions:[n.Action.YES,n.Action.NO],onClose:async e=>{if(e===n.Action.YES){const e=this.byId("MovementsTable");const t=e.getItems();try{t.forEach(e=>+
{const t=e.getBindingContext();const o=e.getCells().find(e=>e.getMetadata().getName()==="sap.m.MultiInput");const n=o?.getTokens();const s=new r(this.getModel(),"serialNumbers",t);s.getAllCurrentContexts()?.forEach(e=>e.delete());n.forEach(e=>{s.create({+
PurchasingDocumentNumber:t.getProperty("PurchasingDocumentNumber"),ItemNumber:t.getProperty("ItemNumber"),Number:e.getKey()})})});this.removeAllMessages();await this.getDataServices().submitChanges({model:this.getModel(),idGroup:"good_receipt",busyContro+
l:this.getView()});this.displayMessageToastSuccess(this.getResourceText("msg.goodreceipt.sucess",null))}catch(e){this.displayMessageToastDanger(this.getResourceText("msg.goodreceipt.error",null))}finally{t.forEach(e=>{this.getDataServices().readObjectPro+
mise({model:this.getModel(),path:e.getBindingContext("POItem").getPath(),forceReload:true})});this.openMessagePopover()}}}})},onMatDoccumentPress:function(e){const t=e.getSource()?.getBindingContext();if(t==null)return;let o=t.getProperty("MaterialDocume+
nt");let n=t.getProperty("MaterialDocumentYear");let r="#MaterialMovement-displayList&"+`/F_Mmim_Findmatdoc(MaterialDocument='${o}',MaterialDocumentYear='${n}',MaterialDocumentItem='0001',StockChangeType='05',StockChangeContext='')`;let s=window.location+
.href.split("#")[0]+r;sap.m.URLHelper.redirect(s,true)},onRemoveMovement:function(e){const t=e.getSource()?.getParent();this.byId("MovementsTable")?.removeItem(t);const o=e.getSource()?.getBindingContext();if(o?.created()!==undefined){o?.delete()}},onCan+
cel:function(e){this.byId("MovementsTable")?.destroyItems();this.getModel().resetChanges(null,true,true);this.getRouter().navTo("RouteItemsList",null,null,true);this.getOwnerComponent().setSelectionChanged(true)}})});                                      
//# sourceMappingURL=Movement.controller.js.map                                                                                                                                                                                                                