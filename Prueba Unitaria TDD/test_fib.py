import unittest

class TestFibonacci(unittest.TestCase):

    def test_valor_inicial(self):
        self.assertEquals(0, self.fib.a)
        self.assertEquals(1, self.fib.b)

    def setUp(self):
        self.fib = Fibonacci()

    def test_serie_fibonacci(self):
        self.fib.serie(10)

class Fibonacci:

    def __init__(self):
        self.a = 0
        self.b = 1

    def serie(self,numero):
        a = 0
        b = 1
        for k in range(numero):
            c=b+a
            a=b
            b=c
        return a

