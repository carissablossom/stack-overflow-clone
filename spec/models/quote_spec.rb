describe Quote, type: :model do
  context "validations" do
    it { should validate_uniqueness_of :content }
  end
  context "fetches quote" do
    it "should get a quote" do
      subject.get_quote.content.should match(/./)
    end
  end
end
