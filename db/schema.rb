# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_11_04_210847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "componente_nome_alternativos", force: :cascade do |t|
    t.bigint "componente_id"
    t.string "nome_alternativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["componente_id"], name: "index_componente_nome_alternativos_on_componente_id"
  end

  create_table "componentes", force: :cascade do |t|
    t.string "cod_europeu"
    t.string "cod_INS"
    t.string "nome"
    t.text "descricao"
    t.integer "class_vegan"
    t.text "justificativa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "marcas", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.integer "class_vegan"
    t.text "justificativa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "produto_nome_alternativos", force: :cascade do |t|
    t.bigint "produto_id"
    t.string "nome_alternativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produto_id"], name: "index_produto_nome_alternativos_on_produto_id"
  end

  create_table "produto_possui_componentes", force: :cascade do |t|
    t.bigint "produto_id"
    t.bigint "componente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["componente_id"], name: "index_produto_possui_componentes_on_componente_id"
    t.index ["produto_id"], name: "index_produto_possui_componentes_on_produto_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "cod_barras"
    t.string "nome"
    t.bigint "marca_id"
    t.text "descricao"
    t.integer "class_vegan"
    t.text "justificativa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["marca_id"], name: "index_produtos_on_marca_id"
  end

  create_table "usuario_busca_componentes", force: :cascade do |t|
    t.bigint "usuario_id"
    t.bigint "componente_id"
    t.string "dt_busca"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["componente_id"], name: "index_usuario_busca_componentes_on_componente_id"
    t.index ["usuario_id"], name: "index_usuario_busca_componentes_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome"
    t.string "sobrenome"
    t.string "cep"
    t.string "pais"
    t.string "telefone"
    t.integer "tipo_usuario"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "componente_nome_alternativos", "componentes"
  add_foreign_key "produto_nome_alternativos", "produtos"
  add_foreign_key "produto_possui_componentes", "componentes"
  add_foreign_key "produto_possui_componentes", "produtos"
  add_foreign_key "produtos", "marcas"
  add_foreign_key "usuario_busca_componentes", "componentes"
  add_foreign_key "usuario_busca_componentes", "usuarios"
end
