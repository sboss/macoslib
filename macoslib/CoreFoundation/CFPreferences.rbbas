	#tag Class	Class CFPreferences		#tag Method, Flags = &h0			 Shared Function Sync() As Boolean			  #if targetMacOS			    soft declare function CFPreferencesAppSynchronize lib CarbonFramework (applicationID as Ptr) as Boolean			    			    dim appID as Ptr = CurrentApplication			    if appID <> nil then			      return CFPreferencesAppSynchronize(appID)			    else			      return false			    end if			  #endif			End Function		#tag EndMethod<<<<<<< .mine	#tag Method, Flags = &h21		Private Shared Function CurrentApplication() As Ptr		  dim carbon as CFBundle = CFBundle.CarbonBundle		  if carbon is nil then		    return nil		  end if		  		  const kCFPreferencesCurrentApplication = "kCFPreferencesCurrentApplication"		  dim p as Ptr = carbon.DataPointer(kCFPreferencesCurrentApplication)		  if p = nil then		    return nil		  else		    return p.Ptr(0)		  end if		End Function	#tag EndMethod=======		#tag Method, Flags = &h21			Private Shared Function CurrentApplication() As Ptr			  static v as Ptr			  if v = nil then			    const kCFPreferencesCurrentApplication = "kCFPreferencesCurrentApplication"			    dim p as Ptr = CFBundle.CarbonFramework.DataPointer(kCFPreferencesCurrentApplication)			    if p <> nil then			      v = p.Ptr(0)			    end if			  end if			  return v			End Function		#tag EndMethod>>>>>>> .r108		#tag Method, Flags = &h0			 Shared Function Value(key as String) As CFType			  // Note: this function may actually return nil - that's if the key does not exist in the prefs			  			  #if targetMacOS			    soft declare function CFPreferencesCopyAppValue lib CarbonFramework (key as CFStringRef, applicationID as Ptr) as Ptr			    			    dim appID as Ptr = CurrentApplication			    if appID <> nil then			      dim p as Ptr = CFPreferencesCopyAppValue(key, appID)			      if p <> nil then			        dim theValue as CFType = CFType.NewObject(p, true)			        if not (theValue isA CFPropertyList) then			          break // oops, this is unexpected			        end if			        return theValue			      end if			    end if			  #endif			End Function		#tag EndMethod		#tag Method, Flags = &h0			 Shared Sub Value(key as String, assigns theValue as CFPropertyList)			  #if targetMacOS			    soft declare sub CFPreferencesSetAppValue lib CarbonFramework (key as CFStringRef, value as Ptr, applicationID as Ptr)			    			    if not (theValue is nil) then			      dim appID as Ptr = CurrentApplication			      if appID <> nil then			        CFPreferencesSetAppValue key, theValue.Reference, appID			      end if			    end if			  #endif			End Sub		#tag EndMethod		#tag Method, Flags = &h0			 Shared Function Keys() As String()			  dim theList() as String			  			  #if targetMacOS			    			    dim appID as Ptr = CurrentApplication			    dim user as Ptr = CurrentUser			    dim host as Ptr = AnyHost			    if appID = nil or user = nil or host = nil then			      return theList			    end if			    			    soft declare function CFPreferencesCopyKeyList lib CarbonFramework (applicationID as Ptr, userName as Ptr, hostName as Ptr) as Ptr			    			    dim p as Ptr = CFPreferencesCopyKeyList(appID, user, host)			    dim keyArray as new CFArray(p, true) // CFArray can deal with p=nil, so there's no need to check for it here			    for i as Integer = 0 to keyArray.Count - 1			      dim theValue as CFType = keyArray.Value(i)			      theList.Append CFString(theValue)			    next			    			  #endif			  			  return theList			End Function		#tag EndMethod<<<<<<< .mine	#tag Method, Flags = &h21		Private Shared Function CurrentUser() As Ptr		  dim carbon as CFBundle = CFBundle.CarbonBundle		  if carbon is nil then		    return nil		  end if		  		  const kCFPreferencesCurrentUser = "kCFPreferencesCurrentUser"		  dim p as Ptr = carbon.DataPointer(kCFPreferencesCurrentUser)		  if p = nil then		    return nil		  else		    return p.Ptr(0)		  end if		End Function	#tag EndMethod=======		#tag Method, Flags = &h21			Private Shared Function CurrentUser() As Ptr			  static v as Ptr // the app's user can't change while running this app, can he?			  if v = nil then			    const kCFPreferencesCurrentUser = "kCFPreferencesCurrentUser"			    dim p as Ptr = CFBundle.CarbonFramework.DataPointer(kCFPreferencesCurrentUser)			    if p <> nil then			      v = p.Ptr(0)			    end if			  end if			  return v			End Function		#tag EndMethod>>>>>>> .r108<<<<<<< .mine	#tag Method, Flags = &h21		Private Shared Function AnyHost() As Ptr		  dim carbon as CFBundle = CFBundle.CarbonBundle		  if carbon is nil then		    return nil		  end if		  		  const kCFPreferencesAnyHost = "kCFPreferencesAnyHost"		  dim p as Ptr = carbon.DataPointer(kCFPreferencesAnyHost)		  if p = nil then		    return nil		  else		    return p.Ptr(0)		  end if		End Function	#tag EndMethod=======		#tag Method, Flags = &h21			Private Shared Function AnyHost() As Ptr			  static v as Ptr // the app's host can't change while running this app, can it?			  if v = nil then			    const kCFPreferencesAnyHost = "kCFPreferencesAnyHost"			    dim p as Ptr = CFBundle.CarbonFramework.DataPointer(kCFPreferencesAnyHost)			    if p <> nil then			      v = p.Ptr(0)			    end if			  end if			  return v			End Function		#tag EndMethod>>>>>>> .r108		#tag ViewBehavior			#tag ViewProperty				Name="Name"				Visible=true				Group="ID"				InheritedFrom="Object"			#tag EndViewProperty			#tag ViewProperty				Name="Index"				Visible=true				Group="ID"				InitialValue="-2147483648"				InheritedFrom="Object"			#tag EndViewProperty			#tag ViewProperty				Name="Super"				Visible=true				Group="ID"				InheritedFrom="Object"			#tag EndViewProperty			#tag ViewProperty				Name="Left"				Visible=true				Group="Position"				InitialValue="0"				InheritedFrom="Object"			#tag EndViewProperty			#tag ViewProperty				Name="Top"				Visible=true				Group="Position"				InitialValue="0"				InheritedFrom="Object"			#tag EndViewProperty		#tag EndViewBehavior	End Class	#tag EndClass