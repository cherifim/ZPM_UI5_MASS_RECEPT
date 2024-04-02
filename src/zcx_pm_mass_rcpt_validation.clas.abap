class ZCX_PM_MASS_RCPT_VALIDATION definition
  public
  inheriting from ZCX_PM_MASS_RECEIPT_EXCEPTION
  create public .

public section.

  types:
    BEGIN OF tys_validation_messsage,
        bapiret_msg     TYPE bapiret2,
        fields          TYPE STANDARD TABLE OF bapi_fld WITH DEFAULT KEY,
        request_context TYPE REF TO /iwbep/cl_mgw_request,
      END OF tys_validation_messsage .
  types:
    tyt_validation_messages TYPE STANDARD TABLE OF tys_validation_messsage WITH DEFAULT KEY .

  data FIELD_NAME type STRING .
  data VALIDATION_MESSAGES type TYT_VALIDATION_MESSAGES .

  methods CONSTRUCTOR
    importing
      !TEXTID like IF_T100_MESSAGE=>T100KEY optional
      !PREVIOUS like PREVIOUS optional
      !FIELD type STRING optional
      !BAPIRET_MESSAGES type BAPIRET2_T optional
      !ODATAV2_REQUEST_CONTEXT type ref to /IWBEP/CL_MGW_REQUEST optional
      !TEXT type STRING optional
      !MSG_TYPE type SYMSGTY default 'E'
      !FIELD_NAME type STRING optional
      !VALIDATION_MESSAGES type TYT_VALIDATION_MESSAGES optional .
  methods GET_VALIDATION_MESSAGES
    returning
      value(MESSAGES) type TYT_VALIDATION_MESSAGES .
protected section.
private section.
ENDCLASS.



CLASS ZCX_PM_MASS_RCPT_VALIDATION IMPLEMENTATION.


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
me->FIELD_NAME = FIELD_NAME .
me->VALIDATION_MESSAGES = VALIDATION_MESSAGES .
clear me->textid.
if textid is initial.
  IF_T100_MESSAGE~T100KEY = IF_T100_MESSAGE=>DEFAULT_TEXTID.
else.
  IF_T100_MESSAGE~T100KEY = TEXTID.
endif.
  endmethod.


METHOD get_validation_messages.
  messages[] = me->validation_messages[].
ENDMETHOD.
ENDCLASS.
