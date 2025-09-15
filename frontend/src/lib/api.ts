const API_BASE_URL = 'http://localhost:3000/api/v1';

export interface Contact {
  id: number;
  first_name: string;
  last_name: string;
  email: string;
  phone?: string;
  company?: string;
  tags?: string;
  next_follow_up_date?: string;
  created_at: string;
  updated_at: string;
}

export interface CreateContactData {
  first_name: string;
  last_name: string;
  email: string;
  phone?: string;
  company?: string;
  tags?: string;
  next_follow_up_date?: string;
}

class ApiService {
  private async request<T>(endpoint: string, options: RequestInit = {}): Promise<T> {
    const url = `${API_BASE_URL}${endpoint}`;
    const config: RequestInit = {
      headers: {
        'Content-Type': 'application/json',
        ...options.headers,
      },
      ...options,
    };

    const response = await fetch(url, config);

    if (!response.ok) {
      throw new Error(`API Error: ${response.status} ${response.statusText}`);
    }

    return response.json();
  }

  // GET /api/v1/contacts
  async getContacts(): Promise<Contact[]> {
    return this.request<Contact[]>('/contacts');
  }

  // GET /api/v1/contacts/:id
  async getContact(id: number): Promise<Contact> {
    return this.request<Contact>(`/contacts/${id}`);
  }

  // POST /api/v1/contacts
  async createContact(data: CreateContactData): Promise<Contact> {
    return this.request<Contact>('/contacts', {
      method: 'POST',
      body: JSON.stringify({ contact: data }),
    });
  }

  // PATCH /api/v1/contacts/:id
  async updateContact(id: number, data: Partial<CreateContactData>): Promise<Contact> {
    return this.request<Contact>(`/contacts/${id}`, {
      method: 'PATCH',
      body: JSON.stringify({ contact: data }),
    });
  }

  // DELETE /api/v1/contacts/:id
  async deleteContact(id: number): Promise<void> {
    return this.request<void>(`/contacts/${id}`, {
      method: 'DELETE',
    });
  }
}

export const apiService = new ApiService();