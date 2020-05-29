class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    save
  end

  def save
    self.class.all << self
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    # binding.pry
    if !valid? || !enough_money?
      # binding.pry
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif !complete?
      # binding.pry
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    if complete?
      self.sender.balance += amount
      self.receiver.balance -= amount

      self.status = "reversed"
    end
  end

  def enough_money?
    self.sender.balance >= self.amount
  end

  def complete?
    self.status == "complete"
  end

  def self.all
    @@all
  end

end
