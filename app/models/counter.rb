class Counter
  include Mongoid::Document

  field :key, type: String
  field :counter, type: Integer, default: 0

  index({ key: 1 }, { unique: true })

  def increment!
    update!(counter: counter + 1)
  end
end
