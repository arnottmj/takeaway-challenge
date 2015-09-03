require 'checkout'

describe Checkout do

  let(:order) {double :order}

  subject {Checkout.new(order)}

  it {expect(subject).to respond_to :submit}

  context 'submit should' do

    it 'raise error if the order total is zero' do
      allow(subject).to receive(:calc_total) {0}
      expect{subject.submit}.to raise_error 'your order is empty'
    end

    it 'raise error if it has already been successful' do
      allow(subject).to receive(:calc_total) {10}
      allow(subject).to receive(:complete) {true}
      expect{subject.submit}.to raise_error 'checkout already complete'
    end

  end

end
