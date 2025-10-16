CLASS zcl_aaic_example_fc_google DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_aaic_example_fc_google IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: l_api_key             TYPE string,
          l_message             TYPE string,
          l_system_instructions TYPE string.

    DATA(lo_aaic_conn) = NEW ycl_aaic_conn( i_api = yif_aaic_const=>c_google ).

    lo_aaic_conn->set_base_url( i_base_url = 'https://generativelanguage.googleapis.com' ).

    lo_aaic_conn->set_api_key( i_api_key = l_api_key ).

    DATA(lo_aaic_google) = NEW ycl_aaic_google( i_model = 'gemini-2.5-flash'
                                                i_o_connection = lo_aaic_conn ).

    l_system_instructions = |# Identity\n|.
    l_system_instructions = |{ l_system_instructions }You are a friendly and helpful math support assistant.\n|.
    l_system_instructions = |{ l_system_instructions }Your primary role is to assist users with mathematical questions and problems.\n|.
    l_system_instructions = |{ l_system_instructions }You must use the provided calculation tools to solve numerical problems, ensuring accuracy.\n|.
    l_system_instructions = |{ l_system_instructions }Never do the calculations yourself. Always use the provided tools instead, respecting the results returned.\n|.
    l_system_instructions = |{ l_system_instructions }Call one tool at a time. You must wait for the result from one tool before making any subsequent tool calls.\n|.
    l_system_instructions = |{ l_system_instructions }Never send multiple tool calls at once.\n|.
    l_system_instructions = |{ l_system_instructions }Always be patient, encouraging, and explain your steps in a clear and understandable way.\n|.

    lo_aaic_google->set_system_instructions( l_system_instructions ).

    DATA(lo_function_calling) = NEW ycl_aaic_func_call_google( ).

    lo_function_calling->add_methods( VALUE #( ( class_name = 'zcl_aaic_math_tools'
                                                 method_name = 'add'
                                                 description = 'Use this method to add two numbers (i_num1 + i_num2)' )

                                               ( class_name = 'zcl_aaic_math_tools'
                                                 method_name = 'subtract'
                                                 description = 'Use this method to subtract two numbers (i_num1 - i_num2)' )

                                               ( class_name = 'zcl_aaic_math_tools'
                                                 method_name = 'multiply'
                                                 description = 'Use this method to multiply two numbers (i_num1 * i_num2)' )

                                               ( class_name = 'zcl_aaic_math_tools'
                                                 method_name = 'divide'
                                                 description = 'Use this method to divide two numbers (i_num1 / i_num2)' ) ) ).

    lo_aaic_google->bind_tools( lo_function_calling ).

    l_message = 'Hi there! What is the result of 5 + 7?'.

    lo_aaic_google->chat(
      EXPORTING
        i_message    = l_message
      IMPORTING
        e_t_response = DATA(lt_response)
    ).

    out->write( lt_response ).

  ENDMETHOD.

ENDCLASS.
