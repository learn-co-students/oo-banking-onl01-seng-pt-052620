class BankAccount
  
  attr_reader :name, :status
  attr_accessor :balance
  def initialize(account_name)
    @name = account_name
    @status = "open"
    @balance = 1000
  end
  
  def withdraw(amount)
    @balance -= amount
  end
  
  def deposit(amount)
    @balance += amount
  end
  
  def display_balance
    "Your balance is $#{self.balance}."
  end
  
  def valid?
    @status == "open" && @balance > 0 
  end
  
  def status=(status)
    @status = status
  end
  
  def close_account
    @balance = 0 
    @status = "closed"
  end



end
