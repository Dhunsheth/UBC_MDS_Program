import unittest
import calculator as cal

class TestAdd(unittest.TestCase):

    def test_maximum(self): # test routine
        self.assertEqual(cal.maximum(10,20), 20)

unittest.main(argv=[''], verbosity=2, exit=False)