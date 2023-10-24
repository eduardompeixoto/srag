pkgload::load_all()

df_esus <- esus()

save(df_esus, file="inst/srag.RData")

commit_message <- paste0("", Sys.time())

writeLines(commit_message, "mensagem-comit.txt")
