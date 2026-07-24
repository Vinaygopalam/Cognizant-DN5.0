
using System;

public interface IMailSender
{
    bool SendMail(string address, string body);
}

public class CustomerComm
{
    private readonly IMailSender _sender;

    public CustomerComm(IMailSender sender)
    {
        _sender = sender;
    }

    public bool SendMailToCustomer()
    {
        return _sender.SendMail("test@cognizant.com", "Notification Alert");
    }
}

public class MockMailEngine : IMailSender
{
    public bool SendMail(string address, string body)
    {
        return true;
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("----- EXECUTION: INDIVIDUAL MOQ RUNNER -----");

        IMailSender mockInstance = new MockMailEngine();

        CustomerComm engine = new CustomerComm(mockInstance);

        Console.WriteLine("[INFO] Mock instance created successfully using constructor injection.");

        bool result = engine.SendMailToCustomer();

        if (result)
        {
            Console.WriteLine("[PASS] Mock response verified successfully.");
        }
        else
        {
            Console.WriteLine("[FAIL] Mock response verification failed.");
        }
    }
}