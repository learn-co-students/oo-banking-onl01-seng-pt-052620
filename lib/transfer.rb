class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount, :balance
  
  @@all = []
  
  def initialize(account_name1, account_name2, amount)
    @sender = account_name1
    @receiver = account_name2
    @status = "pending"
    @amount = amount
  end 
  
  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance > amount
  end
  
  
  
  def execute_transaction 
    return if self.status == "complete"
    if !self.valid? 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    else 
      @sender.withdraw(amount)
      @receiver.deposit(amount)
      self.status = "complete"
     end
   end 
   
   def reverse_transfer
     return if self.status == "pending"
     @sender.deposit(amount)
     @receiver.withdraw(amount)
     self.status = "reversed"
   end
  
end
