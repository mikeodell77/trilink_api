class ChainsawController < ApplicationController
  def index
    if chainsaw_params[:home] == 'true'
      @chainsaws = TblHdChainsawsMod.replacements(chainsaw_params)
    else
      @chainsaws = TblChainsaw.replacements(chainsaw_params)
    end
    render json: @chainsaws
  end

  def depot_link
    @link = TblHdCrossref.select(:url).where(
      barlength: home_depot_params[:barlength], 
      drivelink: home_depot_params[:drivelink], 
      gauge: home_depot_params[:gauge],
      pitch: home_depot_params[:pitch])

    puts "Found link : #{@link}"
    render json: @link
  end

  def brands
    @brands = TblChainsaw.distinct_brands
    render json: @brands
  end

  def models
    @models = TblChainsaw.select(:model).distinct.where(brand: chainsaw_params[:brand])
    render json: @models
  end

  def barlengths
    @bar_lengths = TblChainsaw.select(:barlength).distinct.where(brand: chainsaw_params[:brand], model: chainsaw_params[:model])
    render json: @bar_lengths
  end

  def pitches
    puts "Inside pitches controller"
    @pitches = TblChainsaw.select(:pitch).distinct.where(brand: chainsaw_params[:brand], model: chainsaw_params[:model], barlength: chainsaw_params[:barlength])
    render json: @pitches
  end

  def gauges
    @gauges = TblChainsaw.select(:gauge).distinct.where(brand: chainsaw_params[:brand], model: chainsaw_params[:model], barlength: chainsaw_params[:barlength], pitch: chainsaw_params[:pitch])
    render json: @gauges
  end

  def kickbacks
    @kickbacks = TblChainsaw.select(:kickback).distinct.where(brand: chainsaw_params[:brand], model: chainsaw_params[:model], barlength: chainsaw_params[:barlength], pitch: chainsaw_params[:pitch], gauge: chainsaw_params[:gauge])
    render json: @kickbacks
  end

  def hd_brands
    @brands = TblHdChainsawsMod.distinct_brands
    render json: @brands
  end

  def hd_models 
    @models = TblHdChainsawsMod.select(:model).distinct.where(brand: chainsaw_params[:brand])
    render json: @models
  end
    
  def hd_barlengths
    @bar_lengths = TblHdChainsawsMod.select(:barlength).distinct.where(brand: chainsaw_params[:brand], model: chainsaw_params[:model])
    render json: @bar_lengths
  end

  def hd_pitches
    @pitches = TblHdChainsawsMod.select(:pitch).distinct.where(brand: chainsaw_params[:brand], model: chainsaw_params[:model], barlength: chainsaw_params[:barlength])
    render json: @pitches
  end

  def hd_gauges
    @gauges = TblHdChainsawsMod.select(:gauge).distinct.where(brand: chainsaw_params[:brand], model: chainsaw_params[:model], barlength: chainsaw_params[:barlength], pitch: chainsaw_params[:pitch])
    puts ">>>>>>>> gauges : #{@gauges.inspect}"
    render json: @gauges
  end

  def hd_kickbacks
    @kickbacks = TblHdChainsawsMod.select(:kickback).distinct.where(brand: chainsaw_params[:brand], model: chainsaw_params[:model], barlength: chainsaw_params[:barlength], pitch: chainsaw_params[:pitch], gauge: chainsaw_params[:gauge])
    render json: @kickbacks
  end


  private
  def chainsaw_params
    params.permit(:brand, :model, :barlength, :pitch, :gauge, :kickback, :home)
  end

  def home_depot_params
    params.permit(:barlength, :drivelink, :pitch, :gauge)
  end
end
