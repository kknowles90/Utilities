using System;

public class Holder
{
    string cardNum;
    int pin;
    string firstName;
    string lastName;
    double balance;

    /// <summary>
    /// Constructors
    /// </summary>
    public Holder(string cardNum, int pin, string firstName, string lastName, double balance)
    {
        this.cardNum = cardNum;
        this.pin = pin;
        this.firstName = firstName;
        this.lastName = lastName;
        this.balance = balance;
    }


    /// <summary>
    /// Get Set
    /// </summary>
    public string getNum()
    {
        return cardNum;
    }

    public int getPin()
    {
        return pin;
    }

    public string getFirstName()
    {
        return firstName;
    }

    public string getLastName()
    {
        return lastName;
    }

    public double getBalance()
    {
        return balance;
    }

    public void setNum(String newCardNum)
    {
        cardNum = newCardNum;
    }

    public void setPin(int newPin)
    {
        pin = newPin;
    }

    public void setFirstName(String newFirstName)
    {
        firstName = newFirstName;
    }

    public void setLastName(String newLastName)
    {
        lastName = newLastName;
    }

    public void setBalance(double newBalance)
    {
        balance = newBalance;
    }

    /// <summary>
    /// Main function
    /// </summary>
    public static void Main(String[] args)
    {
        void printOptions()
        {
            Console.WriteLine("Please choose from the options");
            Console.WriteLine("1.Dep");
            Console.WriteLine("2.With");
            Console.WriteLine("3.Bal");
            Console.WriteLine("4.Exit");
        }


        //Might need to insert Try/Catch for Errors
        void dep(Holder currentUser)
        {
            Console.WriteLine("How much would you like to dep?");
            double dep = Double.Parse(Console.ReadLine());
            currentUser.setBalance(dep);
            Console.WriteLine("New Bal: " + currentUser.getBalance());
        }

        void with(Holder currentUser)
        {
            Console.WriteLine("How much would you like to with?");
            double with = Double.Parse(Console.ReadLine());

            //Checking if the user has the enough to with
            if(currentUser.getBalance() > with)
            {
                Console.WriteLine("Insufficient amount");
            }
            else
            {
                currentUser.setBalance(currentUser.getBalance() - with);
                Console.WriteLine("Task completed");
            }
        }

        void bal(Holder currentUser)
        {
            Console.WriteLine("Current Bal: " + currentUser.getBalance());
        }


        /// <summary>
        /// Creating the static List that would be fetched from API
        /// </summary>
        List<Holder> holder = new List<Holder>();
        holder.Add(new Holder("4578654813549876", 1111, "John", "Doubleth", 150.38));
        holder.Add(new Holder("7945987613246549", 2222, "Mark", "Adams", 1776.81));
        holder.Add(new Holder("1243456576189465", 3333, "Bruce", "Lee", 1987.32));
        holder.Add(new Holder("9879465498732165", 4444, "Daniel", "IloveYou", 2023.11));

        /// <summary>
        /// Main Prompt
        /// </summary>
        Console.WriteLine("Welcome to the Calc");


        /// <summary>
        /// First Name check
        /// </summary>
        Console.WriteLine("Welcome to the Calc: Please insert the first name? ");
        String inputFirstName = "";
        Holder currentUser;

        while (true)
        {
            try
            {
                inputFirstName = Console.ReadLine();
                //Checking DB (Static data)
                currentUser = holder.FirstOrDefault(a => a.firstName == inputFirstName);
                if (currentUser != null) { break; }
                else { Console.WriteLine("Not recognized. Try again?"); }
            }

            catch  {Console.WriteLine("Not recognized. Try again?"); }
        }

        /// <summary>
        /// First Name check
        /// </summary>
        Console.WriteLine("Enter your pin: ");
        int inputPin = 0;
        while (true)
        {
            try
            {
                inputPin = int.Parse(Console.ReadLine());
                if (currentUser.getPin() == inputPin) { break; }
                else { Console.WriteLine("Not recognized. Try again?"); }
            }

            catch { Console.WriteLine("Not recognized. Try again?"); }
        }

        Console.WriteLine("Welcome " + currentUser.getFirstName() + currentUser.getLastName());
        int option = 0;
        do
        {
            printOptions();
            try
            {
                option = int.Parse(Console.ReadLine());
            }
            catch { }
            if (option == 1) { dep(currentUser); }
            else if (option == 2) { with(currentUser); }
            else if (option == 3) { bal(currentUser); }
            else if (option == 4) { break; }
            else { option = 0; }
        }
        while (option != 4);
        Console.WriteLine("Thank you");



    }




}