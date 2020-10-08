
    
    <input class="w-75 p-1 rounded @error('search') is-invalid @enderror" type="text" name="search" required>
    <button id="btn-msg" type="submit" class="btn btn-primary px-3"><i class='fas fa-search pr-2'></i></button>

    @error('search')
        <span class="invalid-feedback" role="alert">
            <strong>{{ $message }}</strong>
        </span>
        
    @enderror
   

    
