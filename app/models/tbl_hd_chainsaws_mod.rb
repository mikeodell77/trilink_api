class TblHdChainsawsMod < ApplicationRecord
  scope :search_by_brand, -> (brand) { where("brand = ?", brand) if brand.present? }
  scope :search_by_model, -> (model) { where("model = ?", model) if model.present? }
  scope :search_by_barlength, -> (barlength) { where("barlength = ?", barlength) if barlength.present? }
  scope :search_by_pitch, -> (pitch) { where("pitch = ?", pitch) if pitch.present? }
  scope :search_by_gauge, -> (gauge) { where("gauge = ?", gauge) if gauge.present? }
  scope :search_by_kickback, -> (kickback) { where("kickback = ?", kickback) if kickback.present? }

  def self.distinct_brands
    self.all.distinct.pluck(:brand)
  end

  def self.distinct_models(brand)
    puts ">>>> brand #{brand}"
    self.select(:brand, :model, :barlength).distinct.where(brand: brand)
    # self.where("brand = ?", brand)
  end

  def self.replacements(search_params)
    puts "TblHdChainsawMod | replacements | params : #{search_params}"
    self.search_by_brand(search_params[:brand])
        .search_by_model(search_params[:model])
        .search_by_barlength(search_params[:barlength])
        .search_by_pitch(search_params[:pitch])
        .search_by_gauge(search_params[:gauge])
        # .search_by_kickback(search_params[:kickback])
  end
end
