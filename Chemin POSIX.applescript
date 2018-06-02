---------------------------------------------------------------------------------------------------------------------------
-- Nom du fichier :    Chemin POSIX.applescript
---------------------------------------------------------------------------------------------------------------------------
-- Description      :    Permet de manipuler des chemins POSIX.
---------------------------------------------------------------------------------------------------------------------------
-- Remarques      :
--				    - À enregistrer sous le format "Script" (.scpt)
--				    - À copier dans le dossier ~/Library/Script Libraries/ pour être utilisable ailleurs
--				    - testé sur Mac OS X 10.12.6 (voir la section TESTS plus bas)
---------------------------------------------------------------------------------------------------------------------------


(*
Nom			: extension 
Description	: Renvoi l'extension du fichier
nomComplet	: chemin POSIX complet (ou pas) d'un fichier
retour		: l'extension du fichier
Exemple		: /Users/bru.no/Desktop/lo.g.txt => txt
*)
on extension(nomComplet)
	-- On enregistre les délimiteurs	
	set ATID to AppleScript's text item delimiters
	-- On crée un délimiteur "."
	set AppleScript's text item delimiters to "."
	-- On transforme nomComplet en liste des mots séparés par des points
	set listeCar to text items of nomComplet
	-- On récupère dernier élément de la liste qui correspond à l'extension
	set retour to last item of listeCar
	-- On remets les délimiteurs comme ils étaient au départ
	set AppleScript's text item delimiters to ATID
	
	return retour
	
end extension

(*
Nom			: nom 
Description	: Renvoi le nom du fichier
nomComplet	: chemin POSIX complet (ou pas) d'un fichier
retour		: le nom du fichier
Exemple		: /Users/bru.no/Desktop/lo.g.txt => lo.g.txt
*)
on nom(nomComplet)
	
	-- On enregistre les délimiteurs	
	set ATID to AppleScript's text item delimiters
	-- On crée un délimiteur "."
	set AppleScript's text item delimiters to "/"
	-- On transforme nomComplet en liste des mots séparés par des points
	set listeCar to text items of nomComplet
	-- On récupère dernier élément de la liste qui correspond à l'extension
	set retour to last item of listeCar
	-- On remets les délimiteurs comme ils étaient au départ
	set AppleScript's text item delimiters to ATID
	
	return retour
	
end nom


(*
Nom			: sansExtension 
Description	: Renvoi le nom du fichier sans l'extension
nomComplet	: chemin POSIX complet (ou pas) d'un fichier
retour		: le nom du fichier sans l'extension
Exemple		: /Users/bru.no/Desktop/lo.g.txt => lo.g
*)
on nomSansExtension(nomComplet)
	
	set retour to nom(nomComplet)
	return sansExtension(retour)
	
end nomSansExtension


(*
Nom			: chemin 
Description	: Renvoi le chemin du fichier
nomComplet	: chemin POSIX complet d'un fichier
retour		: le chemin du fichier
Exemple		: /Users/bru.no/Desktop/lo.g.txt => /Users/bru.no/Desktop
*)
on chemin(nomComplet)
	
	-- On enregistre les délimiteurs	
	set ATID to AppleScript's text item delimiters
	-- On crée un délimiteur "."
	set AppleScript's text item delimiters to "/"
	-- On transforme nomComplet en liste des mots séparés par des points
	set listeCar to text items of nomComplet
	-- On enlève le dernier élément de la liste qui correspond au nom
	set liste to (items 1 thru ((count of listeCar) - 1) of listeCar)
	-- On remet les délimiteurs à "/" pour la coercition d'une liste en chaîne
	set AppleScript's text item delimiters to "/"
	-- On transforme la liste en chaîne
	set retour to liste as text
	-- On remets les délimiteurs comme ils étaient au départ
	set AppleScript's text item delimiters to ATID
	
	return retour
	
end chemin


(*
Nom			: sansExtension 
Description	: Renvoi le nom du fichier sans l'extension
nomComplet	: chemin POSIX complet (ou pas) d'un fichier
retour		: le nom du fichier sans l'extension
Exemple		: /Users/bru.no/Desktop/lo.g.txt => /Users/bru.no/Desktop/lo.g
*)
on sansExtension(nomComplet)
	
	-- On enregistre les délimiteurs	
	set ATID to AppleScript's text item delimiters
	-- On crée un délimiteur "."
	set AppleScript's text item delimiters to "."
	-- On transforme nomComplet en liste des mots séparés par des points
	set listeCar to text items of nomComplet
	-- On enlève le dernier élément de la liste qui correspond à l'extension
	set liste to (items 1 thru ((count of listeCar) - 1) of listeCar)
	-- On remet les délimiteurs à "" pour la coercition d'une liste en chaîne
	set AppleScript's text item delimiters to "."
	-- On transforme la liste en chaîne
	set retour to liste as text
	-- On remets les délimiteurs comme ils étaient au départ
	set AppleScript's text item delimiters to ATID
	
	return retour
	
end sansExtension

-----------------------------------------------------------------------------------------------------------
--                                                     TESTS
-----------------------------------------------------------------------------------------------------------

-- Pour tester cette bibliothèque :

-- 1°) Installez la bibliothèque dans le dossier : ~/Library/Script Libraries/
-- 2°) Créez un nouveau fichier script contenant le code suivant :


(*
set cheminComplet to "/Users/bru.no/Desktop/lo.g.txt"
log "cheminComplet : " & cheminComplet

tell script "Chemin POSIX"
	
	log "Nom : " & its nom(cheminComplet)
	
	log "Chemin : " & its chemin(cheminComplet)
	
	log "Nom sans extension : " & its nomSansExtension(cheminComplet)
	
	log "Extension : " & its extension(cheminComplet)
	
	log "Chemin et nom : " & its sansExtension(cheminComplet)
end tell
*)


-----------------------------------------------------------------------------------------------------------
--                                                     FIN
-----------------------------------------------------------------------------------------------------------
