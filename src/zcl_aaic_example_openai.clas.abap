CLASS zcl_aaic_example_openai DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_aaic_example_openai IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: l_api_key TYPE string,
          l_message TYPE string.

    DATA(lo_aaic_conn) = NEW ycl_aaic_conn( i_api = yif_aaic_const=>c_openai ).

    lo_aaic_conn->set_api_key( i_api_key = l_api_key ).

    DATA(lo_aaic_openai) = NEW ycl_aaic_openai( i_model = 'gpt-5-nano'
                                                i_o_connection = lo_aaic_conn ).

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
