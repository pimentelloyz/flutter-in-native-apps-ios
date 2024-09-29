import Foundation
import Supabase

class SupabaseService {
    static let shared = SupabaseService()
    
    let supabase: SupabaseClient

    private init() {
        supabase = SupabaseClient(
            supabaseURL: URL(string: "https://pcjrecnxbcfjvyijenov.supabase.co")!,
            supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBjanJlY254YmNmanZ5aWplbm92Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc1NzA3MDYsImV4cCI6MjA0MzE0NjcwNn0.c4hQH1Pn5hQO6rEg3TyXpuQZsvoPJm9xRUCwHa9qR6g"
        )
    }
}
