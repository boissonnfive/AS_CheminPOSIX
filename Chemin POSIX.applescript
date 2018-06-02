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


on initialize(_nomComplet)
	--on make new cheminPOSIX  given POSIXPath:cheminComplet	
	
	script cheminPOSIX
		
		property name : "cheminPOSIX"
		property _chemin : _nomComplet
		
		
		
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
		
		
		on extension()
			-- On enregistre les délimiteurs	
			set ATID to AppleScript's text item delimiters
			-- On crée un délimiteur "."
			set AppleScript's text item delimiters to "."
			-- On transforme nomComplet en liste des mots séparés par des points
			set listeCar to text items of _chemin
			-- On récupère dernier élément de la liste qui correspond à l'extension
			set retour to last item of listeCar
			-- On remets les délimiteurs comme ils étaient au départ
			set AppleScript's text item delimiters to ATID
			
			return retour
			
		end extension
		
		
		on nom()
			
			-- On enregistre les délimiteurs	
			set ATID to AppleScript's text item delimiters
			-- On crée un délimiteur "."
			set AppleScript's text item delimiters to "/"
			-- On transforme nomComplet en liste des mots séparés par des points
			set listeCar to text items of _chemin
			-- On récupère dernier élément de la liste qui correspond à l'extension
			set retour to last item of listeCar
			-- On remets les délimiteurs comme ils étaient au départ
			set AppleScript's text item delimiters to ATID
			
			return retour
			
		end nom
		
		on nomSansExtension()
			
			set retour to nom()
			return sansExtension(retour)
			
		end nomSansExtension
		
		on chemin()
			
			-- On enregistre les délimiteurs	
			set ATID to AppleScript's text item delimiters
			-- On crée un délimiteur "."
			set AppleScript's text item delimiters to "/"
			-- On transforme nomComplet en liste des mots séparés par des points
			set listeCar to text items of _chemin
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
		
	end script
	
	return cheminPOSIX
	
end initialize
--end make


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
