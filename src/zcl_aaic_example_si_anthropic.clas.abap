CLASS zcl_aaic_example_si_anthropic DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_aaic_example_si_anthropic IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: l_api_key             TYPE string,
          l_message             TYPE string,
          l_system_instructions TYPE string.

    DATA(lo_aaic_conn) = NEW ycl_aaic_conn( i_api = yif_aaic_const=>c_anthropic ).

    lo_aaic_conn->set_base_url( i_base_url = 'https://api.anthropic.com' ).

    lo_aaic_conn->set_api_key( i_api_key = l_api_key ).

    DATA(lo_aaic_anthropic) = NEW ycl_aaic_anthropic( i_model = 'claude-sonnet-4-20250514'
                                                      i_o_connection = lo_aaic_conn ).

    l_system_instructions = |# Identity\n|.
    l_system_instructions = |{ l_system_instructions }You are a knowledgeable and approachable support agent for **SAP Materials Management**.\n|.

    lo_aaic_anthropic->set_system_instructions( l_system_instructions ).

    l_message = 'Hi there! What is your area of expertise?'.

    lo_aaic_anthropic->chat(
      EXPORTING
        i_message    = l_message
      IMPORTING
        e_t_response = DATA(lt_response)
    ).

    out->write( lt_response ).

  ENDMETHOD.

ENDCLASS.
