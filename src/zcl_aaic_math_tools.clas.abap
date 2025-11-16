CLASS zcl_aaic_math_tools DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

    METHODS add
      IMPORTING
        i_num1   TYPE f
        i_num2   TYPE f
      RETURNING VALUE(r_response) TYPE string.

    METHODS subtract
      IMPORTING
        i_num1   TYPE f
        i_num2   TYPE f
      RETURNING VALUE(r_response) TYPE string.

    METHODS multiply
      IMPORTING
        i_num1   TYPE f
        i_num2   TYPE f
      RETURNING VALUE(r_response) TYPE string.

    METHODS divide
      IMPORTING
        i_num1   TYPE f
        i_num2   TYPE f
      RETURNING VALUE(r_response) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_AAIC_MATH_TOOLS IMPLEMENTATION.


  METHOD add.

    r_response = |The result of { i_num1 } + { i_num2 } is { i_num1 + i_num2 }|.

  ENDMETHOD.


  METHOD subtract.

    r_response = |The result of { i_num1 } - { i_num2 } is { i_num1 - i_num2 }|.

  ENDMETHOD.


  METHOD multiply.

    r_response = |The result of { i_num1 } * { i_num2 } is { i_num1 * i_num2 }|.

  ENDMETHOD.


  METHOD divide.

    IF i_num2 = 0.
      r_response = |Division by zero. The result is undefined|.
      RETURN.
    ENDIF.

    r_response = |The result of { i_num1 } / { i_num2 } is { i_num1 / i_num2 }|.

  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.

    out->write( me->add( i_num1 = 2 i_num2 = 3 ) ).

  ENDMETHOD.
ENDCLASS.
