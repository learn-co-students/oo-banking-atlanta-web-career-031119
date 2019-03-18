class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.status == 'pending'
    sender.withdraw(amount)
    receiver.deposit(amount)
      if self.valid? == true
        self.status = 'complete'
      else
        self.status = 'rejected'
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    # binding.pry
    if self.status == 'complete'
      receiver.withdraw(amount)
      sender.deposit(amount)
      self.status = 'reversed'
      # binding.pry
    end
    # binding.pry
  end
end
