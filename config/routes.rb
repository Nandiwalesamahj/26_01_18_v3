Rails.application.routes.draw do
  get 'galleries/new'

  get 'galleries/edit'

  get 'galleries/destroy'

  get 'galleries/index'

  get 'galleries/create'

  resources :advertises
  resources :sandarbhsuchis
  devise_for :users
  resources :galleries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :home
  resources :aboutsamajs
  resources :feedbacks
  resources :helps
  resources :importantaffairs
  resources :mahatvachevyaktis
  resources :manogats
  resources :messages
  resources :recruitments
  resources :samajikplaces
  resources :samajiksansthas
  resources :sanghatnaactivities
  resources :shasandecisions
  resources :sandarbhsuchis
  resources :tantamuktis
  resources :vadhuvars
  resources :visions
  resources :shaskiyayojanas
  resources :summaries
  resources :searchvadhuvars
  resources :excelattaches
get 'search_form',to: "vadhuvars#search_form"
get 'search_result',to: "vadhuvars#search_result"
get 'admin_edit', to: "users#admin_edit"
get 'shaskiya_karmachari', to: "mahatvachevyaktis#shaskiya_karmachari"
get 'pratishtit_manadal',to: "mahatvachevyaktis#pratishtit_manadal"
get 'puraskar_prapt',to: "mahatvachevyaktis#puraskar_prapt"
get 'samajatil_panch',to: "mahatvachevyaktis#samajatil_panch"
get 'uddyojak',to: "mahatvachevyaktis#uddyojak"
get 'vyapari',to: "mahatvachevyaktis#vyapari"
get 'sevadatey',to: "mahatvachevyaktis#sevadatey"
get 'samaj_bandhav',to: "mahatvachevyaktis#samaj_bandhav"

get 'show_super',to: "vadhuvars#show_super"
get 'show_feedback',to: "feedbacks#show_feedback"
get 'feedback_titles',to: "feedbacks#feedback_titles"
get 'download_file_excel', to: "excelattaches#download_file_excel"

get 'download_file_sandarbhsuchi', to: "sandarbhsuchis#download_file_sandarbhsuchi"
get'zilla_approval', to: "users#zilla_approval"
get'rajya_approval', to: "users#rajya_approval"
get'yuva_approval', to: "users#yuva_approval"
get'vadhuvar_approval', to: "users#vadhuvar_approval"
get'tanta_mukti_approval', to: "users#tanta_mukti_approval"
get 'approval_index', to: "users#approval_index"


get'zilla_disapproval', to: "users#zilla_disapproval"
get'rajya_disapproval', to: "users#rajya_disapproval"
get'yuva_disapproval', to: "users#yuva_disapproval"
get'vadhuvar_disapproval', to: "users#vadhuvar_disapproval"
get'tanta_mukti_disapproval', to: "users#tanta_mukti_disapproval"
get 'disapproval_index', to: "users#disapproval_index"

get 'contact_us', to: "home#contact_us"

get 'download_file_aboutsamaj',to: "aboutsamajs#download_file_aboutsamaj"

get 'download_file_manogat',to: "manogats#download_file_manogat"

get 'download_file_samajiksanstha',to: "samajiksansthas#download_file_samajiksanstha"

get 'download_file_sanghatnaactivity',to: "sanghatnaactivities#download_file_sanghatnaactivity"

get 'download_file_shasandecision',to: "shasandecisions#download_file_shasandecision"

get 'download_file_shaskiyayojana',to: "shaskiyayojanas#download_file_shaskiyayojana"

get 'download_file_vision',to: "visions#download_file_vision"

get 'download_file_recruitment',to: "recruitments#download_file_recruitment"
		
get 'rajyasanghatna_home', to: "home#rajyasanghatna"
	
get 'zilasanghatna_home', to: "home#zilasanghatna"
	   
get 'yuvasanghatna_home', to: "home#yuvasanghatna"
	   
get 'dharmik_places_home', to: "home#dharmik_places"
		
get 'sanghatnaactivities_home', to: "home#sanghatnaactivities"
		
get 'vadhuvar_home', to: "home#vadhuvar"
		
get 'tanta_mukti_samiti_home', to: "home#tanta_mukti_samiti"
		
get 'mahatvachevyakti_home', to: "home#mahatvachevyakti"
		
get 'future_vision_home', to: "home#future_vision"
		
get 'karmachari_bharti_home', to: "home#karmachari_bharti"
		
get 'view_zilla_adhikari', to: "users#view_zilla_adhikari"

get 'download_file', to: "messages#download_file"

get 'new_helper', to: "helps#new_helper"

get 'homepage', to: "home#homepage"

get 'select_rajya_padadhikari', to: "users#select_rajya_padadhikari"

get 'select_yuva_sanghatna', to: "users#select_yuva_sanghatna"

  root to: "home#homepage"
end
