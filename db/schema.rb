# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140317230208) do

  create_table "line_items", force: true do |t|
    t.string   "producto"
    t.integer  "cantidad"
    t.decimal  "precio",      precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "producto_id"
    t.integer  "pedido_id"
  end

  add_index "line_items", ["pedido_id"], name: "index_line_items_on_pedido_id", using: :btree
  add_index "line_items", ["producto_id"], name: "index_line_items_on_producto_id", using: :btree

  create_table "pedidos", force: true do |t|
    t.string   "estado"
    t.string   "medio_pago"
    t.text     "direccion_envio"
    t.string   "ciudad_envio"
    t.string   "nombre_comprador"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "productos", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "fecha_alta"
    t.text     "fabricante"
    t.integer  "cantidad_almacen"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "categoria"
  end

end
