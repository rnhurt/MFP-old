class CallForService < Report

  def self.search(term)
    search = "%#{term}%"
    self.find(:all, :include => [:offense, :location],
      :conditions => ["number LIKE ? OR narrative LIKE ?",
        search, search], :limit => 50)
  end

end
