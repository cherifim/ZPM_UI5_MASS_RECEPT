class ZCL_ZGW_PM_MASS_RECEIP_MPC_EXT definition
  public
  inheriting from ZCL_ZGW_PM_MASS_RECEIP_MPC
  create public .

public section.

  methods DEFINE
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_ZGW_PM_MASS_RECEIP_MPC_EXT IMPLEMENTATION.


METHOD define.
*______________________________________________________________________________________*
* Description:
* See object description
* Techname: ZCL_ZGW_PM_MASS_RECEIP_MPC_EXTCM001
*______________________________________________________________________________________*
* Date of creation: 22.03.2024 21:25:22  / Author: MCHERIFI / Mourad CHERIFI (STMS)
* Reference document:
*  Description :  Redefine method - redefine some metadata
*______________________________________________________________________________________*
* Historic of modifications
* Date / User name / Transport request / VYY-NN <Free>
* Description:
*______________________________________________________________________________________*

  DATA: lo_model  TYPE REF TO /iwbep/cl_mgw_odata_model.
  DATA: lo_entity   TYPE REF TO /iwbep/if_mgw_odata_entity_typ.
  DATA: lo_annotation TYPE REF TO /iwbep/if_mgw_odata_annotation.
  DATA: lo_property TYPE REF TO /iwbep/cl_mgw_odata_property.

  super->define( ).

  lo_model ?= me->model.

  DATA(lt_entity_types) = lo_model->/iwbep/if_mgw_odata_re_model~get_entity_types( ).

  LOOP AT lt_entity_types[] ASSIGNING FIELD-SYMBOL(<entity_type>).
    lo_entity = lo_model->get_entity_type( iv_name = <entity_type>-name ).
    CHECK lo_entity IS BOUND.

    "Make media entities requestable
    IF <entity_type>-is_media_type = abap_true.
      lo_entity->get_property( iv_property_name = 'ContentType')->set_as_content_type( ).
    ENDIF.

    DATA(lt_properties) = lo_entity->get_properties( ).
    LOOP AT lt_properties[] ASSIGNING FIELD-SYMBOL(<property>).
      lo_property ?= <property>-property.

      "Add annotation [sap:display-format] to dates to display them automatically in the right way
      IF lo_property->/iwbep/if_mgw_odata_re_prop~get_internal_type( ) = cl_abap_typedescr=>typekind_date.
        "Add annotation to dates to display them automatically in the right way
        lo_annotation = <property>-property->/iwbep/if_mgw_odata_annotatabl~create_annotation( /iwbep/if_mgw_med_odata_types=>gc_sap_namespace ).
        lo_annotation->add( iv_key = 'display-format' iv_value = 'Date' ).
      ENDIF.

    ENDLOOP.
  ENDLOOP.


ENDMETHOD.
ENDCLASS.
