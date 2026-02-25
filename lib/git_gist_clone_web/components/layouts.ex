defmodule GitGistCloneWeb.Layouts do
  use GitGistCloneWeb, :html

  # ESTA ES LA LÍNEA CLAVE:
  # Importa flash_group, icon, button y otros componentes básicos
  import GitGistCloneWeb.CoreComponents

  # Busca archivos .heex en la carpeta layouts/ para generar funciones (app/1, root/1)
  embed_templates "layouts/*"
end
