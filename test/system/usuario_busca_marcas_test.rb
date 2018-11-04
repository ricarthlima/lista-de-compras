require "application_system_test_case"

class UsuarioBuscaMarcasTest < ApplicationSystemTestCase
  setup do
    @usuario_busca_marca = usuario_busca_marcas(:one)
  end

  test "visiting the index" do
    visit usuario_busca_marcas_url
    assert_selector "h1", text: "Usuario Busca Marcas"
  end

  test "creating a Usuario busca marca" do
    visit usuario_busca_marcas_url
    click_on "New Usuario Busca Marca"

    fill_in "Dt Busca", with: @usuario_busca_marca.dt_busca
    fill_in "Marca", with: @usuario_busca_marca.marca_id
    fill_in "Usuario", with: @usuario_busca_marca.usuario_id
    click_on "Create Usuario busca marca"

    assert_text "Usuario busca marca was successfully created"
    click_on "Back"
  end

  test "updating a Usuario busca marca" do
    visit usuario_busca_marcas_url
    click_on "Edit", match: :first

    fill_in "Dt Busca", with: @usuario_busca_marca.dt_busca
    fill_in "Marca", with: @usuario_busca_marca.marca_id
    fill_in "Usuario", with: @usuario_busca_marca.usuario_id
    click_on "Update Usuario busca marca"

    assert_text "Usuario busca marca was successfully updated"
    click_on "Back"
  end

  test "destroying a Usuario busca marca" do
    visit usuario_busca_marcas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Usuario busca marca was successfully destroyed"
  end
end
