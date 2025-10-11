CLASS zcl_aaic_example_fcprxy_openai DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_aaic_example_fcprxy_openai IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: l_api_key             TYPE string,
          l_message             TYPE string,
          l_system_instructions TYPE string.

    DATA(lo_aaic_conn) = NEW ycl_aaic_conn( i_api = yif_aaic_const=>c_openai ).

    lo_aaic_conn->set_base_url( i_base_url = 'https://api.openai.com' ).

    lo_aaic_conn->set_api_key( i_api_key = l_api_key ).

    DATA(lo_aaic_openai) = NEW ycl_aaic_openai( i_model = 'gpt-5'
                                                i_o_connection = lo_aaic_conn ).

    l_system_instructions = |# Identity\n|.
    l_system_instructions = |{ l_system_instructions }You are a friendly and helpful math support assistant.\n|.
    l_system_instructions = |{ l_system_instructions }Your primary role is to assist users with mathematical questions and problems.\n|.
    l_system_instructions = |{ l_system_instructions }You must use the provided calculation tools to solve numerical problems, ensuring accuracy.\n|.
    l_system_instructions = |{ l_system_instructions }Call one tool at a time. You must wait for the result from one tool before making any subsequent tool calls.\n|.
    l_system_instructions = |{ l_system_instructions }Never send multiple tool calls at once.\n|.
    l_system_instructions = |{ l_system_instructions }Always be patient, encouraging, and explain your steps in a clear and understandable way.\n|.

    lo_aaic_openai->set_system_instructions( l_system_instructions ).

    DATA(lo_function_calling) = NEW ycl_aaic_func_call_openai( ).

    lo_function_calling->add_methods( VALUE #( ( class_name = 'zcl_aaic_math_tools_proxy'
                                                 method_name = 'add'
                                                 description = 'Use this method to add two numbers (i_num1 + i_num2)' )

                                               ( class_name = 'zcl_aaic_math_tools_proxy'
                                                 method_name = 'subtract'
                                                 description = 'Use this method to subtract two numbers (i_num1 - i_num2)' )

                                               ( class_name = 'zcl_aaic_math_tools_proxy'
                                                 method_name = 'multiply'
                                                 description = 'Use this method to multiply two numbers (i_num1 * i_num2)' )

                                               ( class_name = 'zcl_aaic_math_tools_proxy'
                                                 method_name = 'divide'
                                                 description = 'Use this method to divide two numbers (i_num1 / i_num2)' ) ) ).

    lo_aaic_openai->bind_tools( lo_function_calling ).

    l_message = 'Hi there! What is the result of 5 + 7?'.

    lo_aaic_openai->chat(
      EXPORTING
        i_message    = l_message
      IMPORTING
        e_t_response = DATA(lt_response)
    ).

    out->write( lt_response ).

  ENDMETHOD.

ENDCLASS.
