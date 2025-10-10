CLASS zcl_aaic_example_prompt_templ DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_aaic_example_prompt_templ IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_params,
             user_message TYPE string,
             context      TYPE string,
           END OF ty_params.


    " Fill the structure fields with the values you want to substitute for each placeholder in the template.
    " For example, set 'user_message' to the user's chat input and 'context' to any relevant information you want the LLM to use.
    DATA(ls_params) = VALUE ty_params( user_message = 'Text entered by the user in the chat'
                                       context = 'Relevant context or background information for the LLM response' ).

    DATA(lo_prompt_template) = NEW ycl_aaic_prompt_template(
       i_template_text = |**User message**: %USER_MESSAGE% \n\n**Context**:\n\n %CONTEXT% \n\n|
    ).

    DATA(lo_prompt) = NEW ycl_aaic_prompt( ).


    "Generates a prompt string (`l_prompt`) by filling a template with the provided parameters.
    "The `l_prompt` variable will receive a string containing the text generated from the template,
    "with the parameters passed to the template instance inserted into the appropriate placeholders.
    DATA(l_prompt) = lo_prompt->generate_prompt_from_template(
      EXPORTING
        i_o_template = lo_prompt_template
        i_s_params   = ls_params
    ).

    out->write( l_prompt ).

  ENDMETHOD.

ENDCLASS.
