CLASS zcl_aaic_expl_isuite_anthropic DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_aaic_expl_isuite_anthropic IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: l_api_key  TYPE string,
          l_message  TYPE string,
          l_username TYPE string,
          l_password TYPE string.

    DATA(lo_aaic_conn) = NEW ycl_aaic_conn( i_api = yif_aaic_const=>c_anthropic
                                            i_get_x_csrf_token = abap_true
                                            i_username = l_username
                                            i_password = l_password ).

    "Replace the base URL with your Integration Suite base URL
    lo_aaic_conn->set_base_url( i_base_url = 'https://63555fd1trial.it-cpitrial03-rt.cfapps.ap21.hana.ondemand.com' ).

    DATA(lo_aaic_anthropic) = NEW ycl_aaic_anthropic( i_model = 'claude-sonnet-4-20250514'
                                                      i_o_connection = lo_aaic_conn ).

    lo_aaic_anthropic->set_endpoint( i_endpoint = '/http/anthropic/v1/messages' ).

    l_message = 'Hi there! What is the capital of Germany?'.

    lo_aaic_anthropic->chat(
      EXPORTING
        i_message    = l_message
      IMPORTING
        e_t_response = DATA(lt_response)
    ).

    out->write( lt_response ).

  ENDMETHOD.

ENDCLASS.
