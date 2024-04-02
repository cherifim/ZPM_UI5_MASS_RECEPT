class ZCX_PM_MASS_RECEIPT_EXCEPTION definition
  public
  inheriting from CX_STATIC_CHECK
  create public .

public section.

  interfaces IF_T100_MESSAGE .
  interfaces IF_T100_DYN_MSG .

  data FIELD type STRING .
  data BAPIRET_MESSAGES type BAPIRET2_T .
  data ODATAV2_REQUEST_CONTEXT type ref to /IWBEP/CL_MGW_REQUEST .
  data TEXT type STRING .
  data MSG_TYPE type SYMSGTY value 'E' ##NO_TEXT.

  methods CONSTRUCTOR
    importing
      !TEXTID like IF_T100_MESSAGE=>T100KEY optional
      !PREVIOUS like PREVIOUS optional
      !FIELD type STRING optional
      !BAPIRET_MESSAGES type BAPIRET2_T optional
      !ODATAV2_REQUEST_CONTEXT type ref to /IWBEP/CL_MGW_REQUEST optional
      !TEXT type STRING optional
      !MSG_TYPE type SYMSGTY default 'E' .
  methods GET_BAPIRET_MSG
    returning
      value(MESSAGE) type BAPIRET2 .
  methods GET_ROOT_EXCEPTION
    returning
      value(ROOT) type ref to CX_ROOT .
  methods GET_BAPIRET2_MESSAGES
    returning
      value(MESSAGES) type BAPIRET2_T .

  methods IF_MESSAGE~GET_TEXT
    redefinition .
protected section.

  methods GET_MSG_VARIABLE
    importing
      !ATTRIBUT type SCX_ATTRNAME
    returning
      value(VALUE) type STRING .
private section.
ENDCLASS.



CLASS ZCX_PM_MASS_RECEIPT_EXCEPTION IMPLEMENTATION.


  method CONSTRUCTOR.
CALL METHOD SUPER->CONSTRUCTOR
EXPORTING
PREVIOUS = PREVIOUS
.
me->FIELD = FIELD .
me->BAPIRET_MESSAGES = BAPIRET_MESSAGES .
me->ODATAV2_REQUEST_CONTEXT = ODATAV2_REQUEST_CONTEXT .
me->TEXT = TEXT .
me->MSG_TYPE = MSG_TYPE .
clear me->textid.
if textid is initial.
  IF_T100_MESSAGE~T100KEY = IF_T100_MESSAGE=>DEFAULT_TEXTID.
else.
  IF_T100_MESSAGE~T100KEY = TEXTID.
endif.
  endmethod.


METHOD get_bapiret2_messages.
*______________________________________________________________________________________*
* Description:
* See object description
* Techname: ZCX_PP_IMP_EXCEPTION==========CM002
*______________________________________________________________________________________*
* Date of creation: 23.03.2024 16:56:47  / Author: MCHERIFI / Mourad CHERIFI (STMS)
* Reference document:
*  Description : Get all generated messages in BAPIRET2 format
*______________________________________________________________________________________*
* Historic of modifications
* Date / User name / Transport request / VYY-NN <Free>
* Description:
*______________________________________________________________________________________*

  "Add main message if generated
  DATA(ls_message) = me->get_bapiret_msg( ).

  IF ls_message IS NOT INITIAL.
    APPEND ls_message TO messages[].
  ENDIF.

  "If a message target field has been defined on the exception, set it as default target field for the other messafes
  APPEND LINES OF me->bapiret_messages[] TO messages[].
  IF me->field IS NOT INITIAL.
    LOOP AT messages[] ASSIGNING FIELD-SYMBOL(<message>) WHERE field IS INITIAL.
      <message>-field = me->field.
    ENDLOOP.
  ENDIF.

  "Add root exception message if generated
  DATA(lx_root) = me->get_root_exception( ).
  IF lx_root IS BOUND.
    DATA(lv_root_txt) = lx_root->get_text( ).
    IF lv_root_txt IS NOT INITIAL.
      "Create a message out of the error text from the root exception
      APPEND VALUE #( id = 'ZPP_IMP_MSG'
                      number = 000 "Une erreur est survenue : &1 &2 &3 &4
                      message_v1 = lv_root_txt
                      ) TO messages[].
    ENDIF.
  ENDIF.

ENDMETHOD.


METHOD get_bapiret_msg.
*______________________________________________________________________________________*
* Description:
* See object description
* Techname: ZCX_PP_IMP_EXCEPTION==========CM003
*______________________________________________________________________________________*
* Date of creation: 23.03.2024 16:55:04  / Author: MCHERIFI / Mourad CHERIFI (STMS)
* Reference document:
*  Description :  Return the message of type BAPIRET2
*______________________________________________________________________________________*
* Historic of modifications
* Date / User name / Transport request / VYY-NN <Free>
* Description:
*______________________________________________________________________________________*

  CHECK me->if_t100_message~t100key <> me->if_t100_message~default_textid. "Ignore default message

  message-type = me->msg_type.
  message-id = me->if_t100_message~t100key-msgid.
  message-number = me->if_t100_message~t100key-msgno.
  message-message_v1 = me->get_msg_variable( me->if_t100_message~t100key-attr1 ).
  message-message_v2 = me->get_msg_variable( me->if_t100_message~t100key-attr2 ).
  message-message_v3 = me->get_msg_variable( me->if_t100_message~t100key-attr3 ).
  message-message_v4 = me->get_msg_variable( me->if_t100_message~t100key-attr3 ).
  message-field = me->field.

ENDMETHOD.


METHOD get_msg_variable.
*______________________________________________________________________________________*
* Description:
* See object description
* Techname: ZCX_PP_IMP_EXCEPTION==========CM004
*______________________________________________________________________________________*
* Date of creation: 23.03.2024 16:55:44  / Author: MCHERIFI / Mourad CHERIFI (STMS)
* Reference document:
*  Description : Retourne la valeur d'une variable de message
*______________________________________________________________________________________*
* Historic of modifications
* Date / User name / Transport request / VYY-NN <Free>
* Description:
*______________________________________________________________________________________*

  ASSIGN me->(attribut) TO FIELD-SYMBOL(<value>).
  IF sy-subrc = 0.
    value = <value>.
  ENDIF.

ENDMETHOD.


METHOD get_root_exception.
*______________________________________________________________________________________*
* Description:
* See object description
* Techname: ZCX_PP_IMP_EXCEPTION==========CM005
*______________________________________________________________________________________*
* Date of creation: 23.03.2024 16:56:19  / Author: MCHERIFI / Mourad CHERIFI (STMS)
* Reference document:
*  Description : Get root exception
*______________________________________________________________________________________*
* Historic of modifications
* Date / User name / Transport request / VYY-NN <Free>
* Description:
*______________________________________________________________________________________*

  DATA(lo_parent) = me->previous.

  WHILE lo_parent IS BOUND.
    root = lo_parent.
    lo_parent = root->previous.
  ENDWHILE.

ENDMETHOD.


METHOD if_message~get_text.

  IF me->text IS NOT INITIAL.
    result = me->text.
  ELSE.
    result = super->get_text( ).
  ENDIF.

  DATA(lo_root_exception) = me->get_root_exception( ).

  IF lo_root_exception IS BOUND.
    DATA(lv_previous_txt) = lo_root_exception->get_text( ).
    IF lv_previous_txt IS NOT INITIAL.
      result = |{ result } : { lv_previous_txt }|.
    ENDIF.
  ENDIF.

ENDMETHOD.
ENDCLASS.
