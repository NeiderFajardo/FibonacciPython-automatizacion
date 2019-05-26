from behave import *
from test_fib.py import *

@given('Algoritmo de la serie Fibonacci')
def step_impl(context):
    test_valor_inicial()
    setUp()

@when('El usuario digita un numero')
def step_impl(context):
    test_serie_fibonacci()
    assert True is not False

@then('Se calcula la serie')
def step_impl(context):
    assert context.failed is False
