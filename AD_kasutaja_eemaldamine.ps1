$firstname = Read-Host "Sisesta eesnimi"
$lastname = Read-Host "Sisesta perekonnanimi"
$username = $firstname + "." + $lastname
$username = $username.ToLower()
$username = Translit($username)
$displayname = $firstname + " " + $lastname

    if (Get-ADUser -F {SamAccountName -eq $Username})
       {
                Remove-ADUser -identity $username
              echo "Kasutaja $displayname eemaldatud edukalt."
       }
       else
       {
       Write-Warning "Kasutajat ei eksisteeri. Proovi uuesti või kontrolli nime"
        
        }

    

function Translit {
    param(
        [string] $inputString
    )

        $Translit = @{
        [char]'ä' = "a"
        [char]'õ' = "o"
        [char]'ü' = "u"
        [char]'ö' = "o"
        }
        $outputString=""
        foreach ($character in $inputCharacter = $inputString.ToCharArray())
    {   
        if ($Translit[$character] -cne $Null){
        $outputString += $Translit[$character]
        }else {
            $outputString += $character
            }
            }
            Write-Output $outputString
            }