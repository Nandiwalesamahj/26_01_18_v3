class SummariesController < ApplicationController

  def create
    @summary = Summary.new(summary_params)
    if @summary.save
      redirect_back(fallback_location: homepage_path)
    end
  end

  # PATCH/PUT /summaries/1
  # PATCH/PUT /summaries/1.json
  def update
    @summary = Summary.find(params[:id])
    if @summary.update(summary_params)
    redirect_back(fallback_location: homepage_path)

    end
  end

  # DELETE /summaries/1
  # DELETE /summaries/1.json
  def destroy
    if @summary.destroy
    
    end
  end

  private
    def summary_params
      params.require(:summary).permit(:मुंबई_शहर,:मुंबई_उपनगर,:ठाणे,:पालचर,:राजगड,:रत्नागिरी,:सिंधुदुर्ग,:नाशिक,:धुळे,:नंदुरबार,:जळगाव,:अहमदनगर,:पुणे,:सातारा,:सांगली,:सोलापूर,:कोल्हापूर,:औरंगाबाद,:जालना,:परभणी,:हिंगोली,:बीड,:नांदेड,:उस्मानाबाद,:लातूर,:अमरावती,:बुलढाणा,:अकोला,:वाशिम,:यवतमाळ,:नागपूर,:वर्धा,:भंडारा,:गोंदिया,:चंद्रपूर,:गडचिरोली,:Rajya_sanghatna_summary,:Zilla_sanghatna_summary,:Dharmik_places_summary,:Sanghatna_activity_summary,:Yuva_sanghatna_summary,:Vadhuvar_summary,:Tantamukti_summary,:important_people_summary,:future_vision_summary,:recruitment_summary,:sandarbhsuchi_summary,:aboutsamaj_summary,:shaskiyayojana_summary,:shasannirnay_summary,:samajiksanstha_summary,:help_summary,:pratikriya_summary)
     end
end
