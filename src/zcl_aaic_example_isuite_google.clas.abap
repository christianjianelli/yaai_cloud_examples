CLASS zcl_aaic_example_isuite_google DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_AAIC_EXAMPLE_ISUITE_GOOGLE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: l_api_key  TYPE string,
          l_message  TYPE string,
          l_username TYPE string,
          l_password TYPE string.

    DATA(lo_aaic_conn) = NEW ycl_aaic_conn( i_api = yif_aaic_const=>c_google
                                            i_get_x_csrf_token = abap_true
                                            i_username = l_username
                                            i_password = l_password ).

    "Replace the base URL with your Integration Suite base URL
    lo_aaic_conn->set_base_url( i_base_url = 'https://7a683cfatrial.it-cpitrial03-rt.cfapps.ap21.hana.ondemand.com' ).

    DATA(lo_aaic_google) = NEW ycl_aaic_google( i_model = 'gemini-2.5-flash'
                                                i_o_connection = lo_aaic_conn ).

    lo_aaic_google->set_endpoint( i_endpoint = '/http/restapi/google/gemini-2.5-flash' ).

    l_message = 'Hi there! What is the capital of Spain?'.

    lo_aaic_google->chat(
      EXPORTING
        i_message    = l_message
      IMPORTING
        e_t_response = DATA(lt_response)
    ).

    out->write( lt_response ).

  ENDMETHOD.
ENDCLASS.
