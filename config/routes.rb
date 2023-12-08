Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  # Routes for the Conservation ctum resource:

  # CREATE
  post("/insert_conservation_ctum", { :controller => "conservation_cta", :action => "create" })
          
  # READ
  get("/conservation_cta", { :controller => "conservation_cta", :action => "index" })
  
  get("/conservation_cta/:path_id", { :controller => "conservation_cta", :action => "show" })
  
  # UPDATE
  
  post("/modify_conservation_ctum/:path_id", { :controller => "conservation_cta", :action => "update" })
  
  # DELETE
  get("/delete_conservation_ctum/:path_id", { :controller => "conservation_cta", :action => "destroy" })

  #------------------------------

  # Routes for the Bingo board resource:

  # CREATE
  post("/insert_bingo_board", { :controller => "bingo_boards", :action => "create" })
          
  # READ
  get("/bingo_boards", { :controller => "bingo_boards", :action => "index" })
  
  get("/bingo_boards/:path_id", { :controller => "bingo_boards", :action => "show" })
  
  # UPDATE
  
  post("/modify_bingo_board/:path_id", { :controller => "bingo_boards", :action => "update" })
  
  # DELETE
  get("/delete_bingo_board/:path_id", { :controller => "bingo_boards", :action => "destroy" })

  #------------------------------

  # Routes for the Bingo tile resource:

  # CREATE
  post("/bingo_tiles/:path_id/insert_tile", { :controller => "bingo_tiles", :action => "create" })
          
  # READ
  get("/bingo_tiles", { :controller => "bingo_tiles", :action => "index" })
  
  get("/bingo_tiles/:path_id", { :controller => "bingo_tiles", :action => "show" })
  
  # UPDATE
  
  post("/modify_bingo_tile/:path_id", { :controller => "bingo_tiles", :action => "update" })
  
  # DELETE
  get("/delete_bingo_tile/:path_id", { :controller => "bingo_tiles", :action => "destroy" })

  #------------------------------

  # Routes for the Photo resource:

  # CREATE
  post("/insert_photo", { :controller => "photos", :action => "create" })
          
  # READ
  get("/photos", { :controller => "photos", :action => "index" })
  
  get("/photos/:path_id", { :controller => "photos", :action => "show" })
  
  # UPDATE
  
  post("/modify_photo/:path_id", { :controller => "photos", :action => "update" })
  
  # DELETE
  get("/delete_photo/:path_id", { :controller => "photos", :action => "destroy" })

  #------------------------------

  # Routes for the Fact resource:

  # CREATE
  post("/insert_fact", { :controller => "facts", :action => "create" })
          
  # READ
  get("/facts", { :controller => "facts", :action => "index" })
  
  get("/facts/:path_id", { :controller => "facts", :action => "show" })
  
  # UPDATE
  
  post("/modify_fact/:path_id", { :controller => "facts", :action => "update" })
  
  # DELETE
  get("/delete_fact/:path_id", { :controller => "facts", :action => "destroy" })

  #------------------------------

  # Routes for the Wildlife resource:

  # CREATE
  post("/insert_wildlife", { :controller => "wildlives", :action => "create" })
          
  # READ
  get("/wildlives", { :controller => "wildlives", :action => "index" })
  
  get("/wildlives/:path_id", { :controller => "wildlives", :action => "show" })
  
  # UPDATE
  
  post("/modify_wildlife/:path_id", { :controller => "wildlives", :action => "update" })
  
  # DELETE
  get("/delete_wildlife/:path_id", { :controller => "wildlives", :action => "destroy" })

  #------------------------------

  # Routes for the Park resource:

  # CREATE
  post("/insert_park", { :controller => "parks", :action => "create" })
          
  # READ
  get("/parks", { :controller => "parks", :action => "index" })
  
  get("/parks/:path_id", { :controller => "parks", :action => "show" })
  
  # UPDATE
  
  post("/modify_park/:path_id", { :controller => "parks", :action => "update" })
  
  # DELETE
  get("/delete_park/:path_id", { :controller => "parks", :action => "destroy" })

  #------------------------------

  # Routes for the Animal resource:

  # CREATE
  post("/insert_animal", { :controller => "animals", :action => "create" })
          
  # READ
  get("/animals", { :controller => "animals", :action => "index" })
  
  get("/animals/:path_id", { :controller => "animals", :action => "show" })
  
  # UPDATE
  
  post("/modify_animal/:path_id", { :controller => "animals", :action => "update" })
  
  # DELETE
  get("/delete_animal/:path_id", { :controller => "animals", :action => "destroy" })

  #------------------------------

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
