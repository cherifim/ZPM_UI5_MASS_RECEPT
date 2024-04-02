class ZCX_PM_GOOD_RECEIPT_ERROR definition
  public
  inheriting from ZCX_PM_MASS_RECEIPT_EXCEPTION
  create public .

public section.

  constants:
    begin of ITEM_NUMBER_NOT_FOUND,
      msgid type symsgid value 'ZPM_MASS_RECEIPT',
      msgno type symsgno value '003',
      attr1 type scx_attrname value 'ITEM_NUMBER',
      attr2 type scx_attrname value 'PURCHASE_ORDER',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of ITEM_NUMBER_NOT_FOUND .
  data PURCHASE_ORDER type EBELN .
  data ITEM_NUMBER type EBELP .

  methods CONSTRUCTOR
    importing
      !TEXTID like IF_T100_MESSAGE=>T100KEY optional
      !PREVIOUS like PREVIOUS optional
      !FIELD type STRING optional
      !BAPIRET_MESSAGES type BAPIRET2_T optional
      !ODATAV2_REQUEST_CONTEXT type ref to /IWBEP/CL_MGW_REQUEST optional
      !TEXT type STRING optional
      !MSG_TYPE type SYMSGTY default 'E'
      !PURCHASE_ORDER type EBELN optional
      !ITEM_NUMBER type EBELP optional .
protected section.
private section.
ENDCLASS.



CLASS ZCX_PM_GOOD_RECEIPT_ERROR IMPLEMENTATION.


  method CONSTRUCTOR.
CALL METHOD SUPER->CONSTRUCTOR
EXPORTING
PREVIOUS = PREVIOUS
FIELD = FIELD
BAPIRET_MESSAGES = BAPIRET_MESSAGES
ODATAV2_REQUEST_CONTEXT = ODATAV2_REQUEST_CONTEXT
TEXT = TEXT
MSG_TYPE = MSG_TYPE
.
me->PURCHASE_ORDER = PURCHASE_ORDER .
me->ITEM_NUMBER = ITEM_NUMBER .
clear me->textid.
if textid is initial.
  IF_T100_MESSAGE~T100KEY = IF_T100_MESSAGE=>DEFAULT_TEXTID.
else.
  IF_T100_MESSAGE~T100KEY = TEXTID.
endif.
  endmethod.
ENDCLASS.
