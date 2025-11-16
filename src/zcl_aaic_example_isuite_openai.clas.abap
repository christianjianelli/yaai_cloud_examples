CLASS zcl_aaic_example_isuite_openai DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_AAIC_EXAMPLE_ISUITE_OPENAI IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: l_api_key  TYPE string,
          l_message  TYPE string,
          l_username TYPE string,
          l_password TYPE string.

    DATA(lo_aaic_conn) = NEW ycl_aaic_conn( i_api = yif_aaic_const=>c_openai
                                            i_get_x_csrf_token = abap_true
                                            i_username = l_username
                                            i_password = l_password ).

    "Replace the base URL with your Integration Suite base URL
    lo_aaic_conn->set_base_url( i_base_url = 'https://7a683cfatrial.it-cpitrial03-rt.cfapps.ap21.hana.ondemand.com' ).

    DATA(lo_aaic_openai) = NEW ycl_aaic_openai( i_model = 'gpt-5-nano'
                                                i_o_connection = lo_aaic_conn ).

    lo_aaic_openai->set_endpoint( i_endpoint = '/http/restapi/openai/v1/responses' ).

    l_message = 'Hi there! What is the capital of France?'.

    lo_aaic_openai->chat(
      EXPORTING
        i_message    = l_message
      IMPORTING
        e_t_response = DATA(lt_response)
    ).

    out->write( lt_response ).

  ENDMETHOD.
ENDCLASS.
