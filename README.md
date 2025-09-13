robot --help - Ajuda com todos os comandos

robot -i menus amazon_test.robot (Executa todos os testes que possuem a tag "menus")

robot -e menus amazon_test.robot (Executa todos testes excluindo aquels com a tag "menus")

robot -d resultados amazon_testes.robot (Salva os arquivos de log e screenshots dentro da pasta resultados)

robot -v BROWSER:firefox -i menus -d resultados amazon_testes.robot (Muda o navegador para o firefox)