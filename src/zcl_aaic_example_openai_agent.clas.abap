CLASS zcl_aaic_example_openai_agent DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_aaic_example_openai_agent IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: l_api_key TYPE string,
          l_message TYPE string.

    DATA(lo_aaic_conn) = NEW ycl_aaic_conn( i_api = yif_aaic_const=>c_openai ).

    lo_aaic_conn->set_base_url( i_base_url = 'https://api.openai.com' ).

    lo_aaic_conn->set_api_key( i_api_key = l_api_key ).

    DATA(lo_aaic_db) = NEW ycl_aaic_db( i_api = yif_aaic_const=>c_openai ).

    DATA(lo_agent) = NEW ycl_aaic_agent(
      i_agent_id = CONV #( 'C6111BEC04B71FE0B9DFCCB09425F70E' ) "Replace the agent id with your agent id
      i_chat_id  = lo_aaic_db->m_id
    ).

    DATA(lo_aaic_openai) = NEW ycl_aaic_openai( i_model = 'gpt-5-nano'
                                                i_o_connection = lo_aaic_conn
                                                i_o_persistence = lo_aaic_db
                                                i_o_agent = lo_agent ).

    l_message = 'What data elements the package yaai_cloud contains?'.

    lo_aaic_openai->chat(
      EXPORTING
        i_message    = l_message
      IMPORTING
        e_t_response = DATA(lt_response)
    ).

    out->write( lt_response ).

  ENDMETHOD.
ENDCLASS.
