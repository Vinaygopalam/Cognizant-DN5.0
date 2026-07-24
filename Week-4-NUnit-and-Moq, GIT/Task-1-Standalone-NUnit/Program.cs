using System;

public class StandaloneNUnitTesting
{
    private static int _a;
    private static int _b;
    private static int _expected;

    public static void Main(string[] args)
    {
        Console.WriteLine("----- EXECUTION: INDIVIDUAL NUNIT RUNNER -----");

        SetUp(10, 20, 30);
        ExecuteTest();
        TearDown();

        SetUp(-5, 5, 0);
        ExecuteTest();
        TearDown();
    }

    private static void SetUp(int inputA, int inputB, int expectedResult)
    {
        Console.WriteLine("[SetUp] Initializing test data...");

        _a = inputA;
        _b = inputB;
        _expected = expectedResult;
    }

    private static void ExecuteTest()
    {
        int actual = _a + _b;

        if (actual == _expected)
        {
            Console.WriteLine($"[PASS] {_a} + {_b} = {actual}");
        }
        else
        {
            Console.WriteLine($"[FAIL] Expected {_expected}, but got {actual}");
        }
    }

    private static void TearDown()
    {
        Console.WriteLine("[TearDown] Cleaning up test data.\n");

        _a = 0;
        _b = 0;
        _expected = 0;
    }
}