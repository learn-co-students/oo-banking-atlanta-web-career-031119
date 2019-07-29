class Transfer
  def initialize(sender, receiver, amount)
    @sender=sender
    @receiver=receiver
    @amount=amount
    @status='pending'
  end

  attr_accessor :sender, :receiver, :amount, :status

  def valid?
    self.sender.valid? && self.receiver.valid? && self.sender.balance-self.amount>=0
  end

  def execute_transaction
    if self.valid? && self.status=='pending'
      self.sender.balance-=self.amount
      self.receiver.balance+=self.amount
      self.status='complete'
    else
      self.status='rejected'
      'Transaction rejected. Please check your account balance.'
    end
  end

  def reverse_transfer
    if self.status=='complete'
      self.receiver.balance-=self.amount
      self.sender.balance+=self.amount
      self.status='reversed'
    else
      'Transfers that have not completed cannot be reversed.'
    end
  end
end