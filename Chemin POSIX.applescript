---------------------------------------------------------------------------------------------------------------------------
-- Nom du fichier :    Chemin POSIX.applescript
---------------------------------------------------------------------------------------------------------------------------
-- Description      :    Permet de manipuler des chemins POSIX.
---------------------------------------------------------------------------------------------------------------------------
-- Remarques      :
--				    - � enregistrer sous le format "Script" (.scpt)
--				    - � copier dans le dossier ~/Library/Script Libraries/ pour �tre utilisable ailleurs
--				    - test� sur Mac OS X 10.12.6 (voir la section TESTS plus bas)
---------------------------------------------------------------------------------------------------------------------------


on initialize(_nomComplet)
	--on make new cheminPOSIX  given POSIXPath:cheminComplet	
	
	script cheminPOSIX
		
		property name : "cheminPOSIX"
		property _chemin : _nomComplet
		
		
		
		on sansExtension(nomComplet)
			
			-- On enregistre les d�limiteurs	
			set ATID to AppleScript's text item delimiters
			-- On cr�e un d�limiteur "."
			set AppleScript's text item delimiters to "."
			-- On transforme nomComplet en liste des mots s�par�s par des points
			set listeCar to text items of nomComplet
			-- On enl�ve le dernier �l�ment de la liste qui correspond � l'extension
			set liste to (items 1 thru ((count of listeCar) - 1) of listeCar)
			-- On remet les d�limiteurs � "" pour la coercition d'une liste en cha�ne
			set AppleScript's text item delimiters to "."
			-- On transforme la liste en cha�ne
			set retour to liste as text
			-- On remets les d�limiteurs comme ils �taient au d�part
			set AppleScript's text item delimiters to ATID
			
			return retour
			
		end sansExtension
		
		
		on extension()
			-- On enregistre les d�limiteurs	
			set ATID to AppleScript's text item delimiters
			-- On cr�e un d�limiteur "."
			set AppleScript's text item delimiters to "."
			-- On transforme nomComplet en liste des mots s�par�s par des points
			set listeCar to text items of _chemin
			-- On r�cup�re dernier �l�ment de la liste qui correspond � l'extension
			set retour to last item of listeCar
			-- On remets les d�limiteurs comme ils �taient au d�part
			set AppleScript's text item delimiters to ATID
			
			return retour
			
		end extension
		
		
		on nom()
			
			-- On enregistre les d�limiteurs	
			set ATID to AppleScript's text item delimiters
			-- On cr�e un d�limiteur "."
			set AppleScript's text item delimiters to "/"
			-- On transforme nomComplet en liste des mots s�par�s par des points
			set listeCar to text items of _chemin
			-- On r�cup�re dernier �l�ment de la liste qui correspond � l'extension
			set retour to last item of listeCar
			-- On remets les d�limiteurs comme ils �taient au d�part
			set AppleScript's text item delimiters to ATID
			
			return retour
			
		end nom
		
		on nomSansExtension()
			
			set retour to nom()
			return sansExtension(retour)
			
		end nomSansExtension
		
		on chemin()
			
			-- On enregistre les d�limiteurs	
			set ATID to AppleScript's text item delimiters
			-- On cr�e un d�limiteur "."
			set AppleScript's text item delimiters to "/"
			-- On transforme nomComplet en liste des mots s�par�s par des points
			set listeCar to text items of _chemin
			-- On enl�ve le dernier �l�ment de la liste qui correspond au nom
			set liste to (items 1 thru ((count of listeCar) - 1) of listeCar)
			-- On remet les d�limiteurs � "/" pour la coercition d'une liste en cha�ne
			set AppleScript's text item delimiters to "/"
			-- On transforme la liste en cha�ne
			set retour to liste as text
			-- On remets les d�limiteurs comme ils �taient au d�part
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

-- Pour tester cette biblioth�que :

-- 1�) Installez la biblioth�que dans le dossier : ~/Library/Script Libraries/
-- 2�) Cr�ez un nouveau fichier script contenant le code suivant :


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
