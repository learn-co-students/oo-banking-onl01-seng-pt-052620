require 'pry'
class BankAccount
  
  attr_reader :name
  attr_accessor :balance, :status
  
def initialize(name)  
  # balance=1000, status= "open"
  @name = name
  @balance=1000
  @status="open"
 end  


  def deposit(deposit_amount)
    @balance += deposit_amount
  end
    
  def display_balance
    p "Your balance is $#{self.balance}."
  end
  
  def valid?
    @balance > 0 && @status == "open"
 end
 
 def withdraw(amount)
   @balance -= amount
 end
 
  def close_account
    @status = "closed"
  end
end
