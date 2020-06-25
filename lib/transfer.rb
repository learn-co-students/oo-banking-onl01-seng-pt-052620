class Transfer

  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender,receiver, amount)
    @sender =sender
    @receiver = receiver
    @amount=amount
    @status="pending"
  end
  
  def valid?
    sender.valid? && receiver.valid? && sender.balance > @amount
  end
  
  def execute_transaction
    return if status == "complete"
    if !self.valid?
      @status ="rejected" 
      return"Transaction rejected. Please check your account balance." 
                    
    else
      @sender.withdraw(amount) 
      @receiver.deposit(amount)
      @status ="complete"
    end
     
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.deposit(amount)
      @receiver.deposit(amount * -1)
      @status = "reversed"
    end
  end
  
end
